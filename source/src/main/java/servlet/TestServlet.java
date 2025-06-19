package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderProductsDAO;
import dao.OrdersDAO;
import dao.ProductsDAO;
import dto.Order;
import dto.OrderProduct;
import dto.Product;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try{
        	ProductsDAO productsDao = new ProductsDAO();
        	List<Product> productData = productsDao.getProductData(1);
        	System.out.println("productsData:"+productData);
        	request.setAttribute("product", productData);
        	OrdersDAO ordersDao = new OrdersDAO();
        	List<Order> orderData = ordersDao.getOrderData(1);
        	System.out.println("ordersData:"+orderData);
        	request.setAttribute("order", orderData);
        	OrderProductsDAO orderProductsDao = new OrderProductsDAO();
        	List<OrderProduct> orderProductData = orderProductsDao.getOrderProductData(1);
        	System.out.println("ordersData:"+orderProductData);
        	request.setAttribute("orderProduct", orderProductData);;
        }catch(Exception e) {
        	System.out.println(e);
        }
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/test.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}