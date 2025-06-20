package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dto.OrderDTO;

public class OrderListDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/e2?serverTimezone=Asia/Tokyo",
            "root", "password"
        );
    }

    // 既存メソッド
    public List<OrderDTO> fetchOrdersWithProducts() throws Exception {
        String sql = """
            SELECT o.order_id, o.total_amount, o.is_paid, o.is_complete, o.is_handed,
                   p.product_name, op.pieces
              FROM orders o
         LEFT JOIN ordered_products op ON o.order_id = op.order_id
         LEFT JOIN products p ON op.product_id = p.product_id
          ORDER BY o.order_id
        """;

        Map<Integer, OrderDTO> orderMap = new LinkedHashMap<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("order_id");
                OrderDTO dto = orderMap.computeIfAbsent(id, k -> {
                    OrderDTO o = new OrderDTO();
                    o.setOrderId(k);
                    try {
	                    o.setTotalAmount(rs.getInt("total_amount"));
	                    o.setPaid(rs.getBoolean("is_paid"));
	                    o.setComplete(rs.getBoolean("is_complete"));
	                    o.setHanded(rs.getBoolean("is_handed"));
	                    o.setProductQuantities(new LinkedHashMap<>());
                    }catch(SQLException e) {
                    	System.out.println(e);
                    };
                    return o;
                });
                String name = rs.getString("product_name");
                int pieces = rs.getInt("pieces");
                if (name != null) {
                    dto.getProductQuantities().put(name, pieces);
                }
            }
        }
        return new ArrayList<>(orderMap.values());
    }

    // 新規：フラグをトグルして、新しい値を返す
    public boolean toggleFlag(int orderId, String flag) throws Exception {
        String column;
        switch (flag) {
            case "paid":     column = "is_paid";    break;
            case "complete": column = "is_complete";break;
            case "handed":   column = "is_handed";  break;
            default: throw new IllegalArgumentException("Unknown flag: " + flag);
        }
        String upd = "UPDATE orders SET " + column + " = NOT " + column + " WHERE order_id = ?";
        String qry = "SELECT " + column + " FROM orders WHERE order_id = ?";
        try (Connection conn = getConnection()) {
            try (PreparedStatement ps = conn.prepareStatement(upd)) {
                ps.setInt(1, orderId);
                ps.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(qry)) {
                ps2.setInt(1, orderId);
                try (ResultSet rs = ps2.executeQuery()) {
                    if (rs.next()) {
                        return rs.getBoolean(column);
                    }
                }
            }
        }
        throw new SQLException("Toggle failed for order " + orderId);
    }
}