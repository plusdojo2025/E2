package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderListDAO;
import dto.OrderDTO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            OrderListDAO dao = new OrderListDAO();

            List<OrderDTO> orders = dao.fetchOrdersWithProducts();

            // 表示する商品のヘッダーを決める
            Set<String> productNamesSet = new LinkedHashSet<>();
            for (OrderDTO o : orders) {
                productNamesSet.addAll(o.getProductQuantities().keySet());
            }
            List<String> productNames = new ArrayList<>(productNamesSet);

            request.setAttribute("orders", orders);
            request.setAttribute("productNames", productNames);
            request.getRequestDispatcher("/WEB-INF/jsp/orderList.jsp")
                   .forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}