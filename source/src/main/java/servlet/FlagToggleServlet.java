package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderListDAO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/toggleFlag")
public class FlagToggleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
	        req.setCharacterEncoding("UTF-8");
	        res.setContentType("application/json; charset=UTF-8");
	        String orderIdStr = req.getParameter("orderId");
	        if (orderIdStr == null || orderIdStr.isEmpty()) {
	            res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            res.getWriter().write("{\"success\":false, \"message\":\"orderIdが空です\"}");
	            return;
	        }
	        int orderId = Integer.parseInt(req.getParameter("orderId"));
	        String flag  = req.getParameter("flag"); // "paid" | "complete" | "handed"
            OrderListDAO dao = new OrderListDAO();
            boolean newVal = dao.toggleFlag(orderId, flag);
            try (PrintWriter out = res.getWriter()) {
                out.print("{\"success\":true,\"newValue\":" + newVal + "}");
            }
        } catch (Exception e) {
        	e.printStackTrace();
            res.setStatus(500);
            try (PrintWriter out = res.getWriter()) {
                out.print("{\"success\":false}");
            }
        }
    }
}