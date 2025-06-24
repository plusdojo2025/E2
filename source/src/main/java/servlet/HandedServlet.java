package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dao.OrderProductsDAO;
import dao.ProductsDAO;
import dto.Product;

@WebServlet("/HandedServlet")
public class HandedServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();

    // JSON → Map<Integer, Integer> にパース
    private Map<Integer,Integer> parseCart(String json) {
        if (json == null || json.isBlank()) return Map.of();
        return gson.fromJson(json, new TypeToken<Map<Integer,Integer>>(){}.getType());
    }

    // orders テーブルに INSERT して生成キー order_id を返す
    private int insertOrder(String orderCode, int totalAmount) throws Exception {
        String sql = """
            INSERT INTO orders
              (order_code, is_paid, is_complete, is_handed, total_amount)
            VALUES (?, 0, 0, 0, ?)
        """;
        try (Connection conn = DriverManager.getConnection(
                 "jdbc:mysql://localhost:3306/e2?characterEncoding=utf8&serverTimezone=GMT%2B9",
                 "root","password");
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, orderCode);
            ps.setInt(2, totalAmount);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) return rs.getInt(1);
            }
        }
        throw new SQLException("order_idの取得に失敗しました");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            // 1) hidden フィールドから cart JSON を取得
            String cartJson = req.getParameter("cart");
            Map<Integer,Integer> cart = parseCart(cartJson);

            // 2) 合計金額を計算
            int total = 0;
            ProductsDAO pDao = new ProductsDAO();
            for (Map.Entry<Integer,Integer> e : cart.entrySet()) {
                Product p = pDao.getProductData(e.getKey());
                total += p.getPrice() * e.getValue();
            }

            // 3) 注文コード生成 (例: 20250620-123045)
            String code = new SimpleDateFormat("yyyyMMdd-HHmmss").format(new Date());

            // 4) orders テーブルに登録 → orderId を取得
            int orderId = insertOrder(code, total);

            // 5) ordered_products テーブルに登録
            OrderProductsDAO opDao = new OrderProductsDAO();
            for (Map.Entry<Integer,Integer> e : cart.entrySet()) {
                opDao.insert(orderId, e.getKey(), e.getValue());
            }

            // 6) 待機画面へフォワード
            req.setAttribute("orderCode", code);
            req.setAttribute("totalAmount", total);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/wait.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    // GET は待機画面へのフォワードのみ（必要に応じて POST のみでよい）
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/wait.jsp");
        dispatcher.forward(req, resp);
    }
}
