package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDAO;
import dto.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // パラメータ取得
    String idStr = req.getParameter("productId");
    int productId = Integer.parseInt(idStr);

    try {
      // DAO で該当商品のみ取得
      ProductsDAO dao = new ProductsDAO();
      Product product = dao.getProductData(productId);

      req.setAttribute("product", product);
      // WEB-INF 配下に置いた JSP へフォワード
      req.getRequestDispatcher("/WEB-INF/jsp/product.jsp")
         .forward(req, resp);

    } catch (Exception e) {
      throw new ServletException(e);
    }
  }
}