package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDAO;
import dto.Product;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            ProductsDAO dao = new ProductsDAO();
            List<Product> list = dao.getDataAll();
            req.setAttribute("products", list);
            req.getRequestDispatcher("/WEB-INF/jsp/home.jsp")
               .forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
