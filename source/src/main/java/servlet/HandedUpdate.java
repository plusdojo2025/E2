package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdersDAO;

/**
 * Servlet implementation class CustomServlet
 */
@WebServlet("/HandedUpdate")
public class HandedUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	OrdersDAO dao = new OrdersDAO();
        
        req.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("/WEB-INF/jsp/cart.jsp")
           .forward(req, resp);
    }
}
