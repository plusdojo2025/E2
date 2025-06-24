package servlet;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dao.OrderProductsDAO;
import dao.OrdersDAO;
import dao.ProductsDAO;
import dto.CartItemDTO;
import dto.Product;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private final ProductsDAO productsDAO        = new ProductsDAO();
    private final OrdersDAO ordersDAO            = new OrdersDAO();
    private final OrderProductsDAO opDAO         = new OrderProductsDAO();
    private final Gson gson                      = new Gson();
    private final Type cartType                  = new TypeToken<Map<Integer,Integer>>(){}.getType();

    // GET でカート画面表示
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // ① クエリパラメータ cart=json を受け取る
        String cartJson = req.getParameter("cart");
        Map<Integer,Integer> cartMap = parseCart(cartJson);

        // ② ProductsDAO で商品情報を取得し、CartItemDTO リストを作成
        List<CartItemDTO> cartItems = new ArrayList<>();
        for (Map.Entry<Integer,Integer> e : cartMap.entrySet()) {
            Product p = productsDAO.getProductData(e.getKey());
            if (p != null) {
                CartItemDTO item = new CartItemDTO();
                item.setProduct(p);
                item.setQuantity(e.getValue());
                System.out.println(item);
                cartItems.add(item);
            }
        }

        // ③ JSP に渡して表示
        req.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("/WEB-INF/jsp/cart.jsp")
           .forward(req, resp);
    }

    // POST で「支払画面へ」→注文登録
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // ① hidden input で渡された最新の cart JSON を取得
        String cartJson = req.getParameter("cart");
        Map<Integer,Integer> cartMap = parseCart(cartJson);

        // ② 合計金額を計算 & 注文コードを生成
        int totalAmount = 0;
        for (Map.Entry<Integer,Integer> e : cartMap.entrySet()) {
            Product p = productsDAO.getProductData(e.getKey());
            totalAmount += p.getPrice() * e.getValue();
        }
        String orderCode = "ORD" + System.currentTimeMillis();

        try {
            // ③ orders テーブルに挿入し、生成された order_id を取ってくる
            int orderId = insertOrderAndGetId(orderCode, totalAmount);

            // ④ ordered_products テーブルに挿入
            for (Map.Entry<Integer,Integer> e : cartMap.entrySet()) {
                opDAO.insert(orderId, e.getKey(), e.getValue());
            }

            // ⑤ 完了画面へリダイレクト
            resp.sendRedirect(req.getContextPath() + "/orderComplete.jsp");
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    // ヘルパー：JSON→Map
    private Map<Integer,Integer> parseCart(String cartJson) {
        if (cartJson == null || cartJson.isBlank()) return new HashMap<>();
        return gson.fromJson(cartJson, cartType);
    }

    // ヘルパー：orders テーブルに INSERT → 生成キー（order_id）を返す
    private int insertOrderAndGetId(String orderCode, int totalAmount) throws Exception {
        // OrdersDAO に既存の insert メソッドがありますが GeneratedKey を返すものがないためここで実装
        String sql = """
            INSERT INTO orders (order_code, is_paid, is_complete, is_handed, total_amount)
            VALUES (?, 0, 0, 0, ?)
        """;
        try (Connection conn = DriverManager.getConnection(
                 "jdbc:mysql://localhost:3306/e2?characterEncoding=utf8&serverTimezone=GMT%2B9",
                 "root","password");
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, orderCode);
            ps.setInt(2, totalAmount);
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
            }
        }
        throw new SQLException("order_id の取得に失敗しました。");
    }
}