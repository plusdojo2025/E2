package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdersDAO;
import dto.Order;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private final OrdersDAO dao = new OrdersDAO();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        List<Integer> orderIdList = new ArrayList<>();
        orderIdList.add(1);
        orderIdList.add(2);
        orderIdList.add(3);

        List<Order> orderList = new ArrayList<>();

        for (int orderId : orderIdList) {
            List<Order> singleOrderList = dao.getOrderData(orderId);
            if (singleOrderList != null && !singleOrderList.isEmpty()) {
                orderList.add(singleOrderList.get(0)); // 1件ずつ追加
            }
        }

        request.setAttribute("orderList", orderList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/order.jsp");
		dispatcher.forward(request, response);
		

	    /*
	    OrdersDAO dao = new OrdersDAO(); 
	    List<Order> orderList = dao.getUncompletedOrders(); // 一括取得するんだーよここーで

	    request.setAttribute("orderList", orderList);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/order.jsp");
	    dispatcher.forward(request, response);
	    */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//文字コード設定
		/*request.setCharacterEncoding("UTF-8");
		
		//リクエストパラメータ取得
		 try {
	            // DAOから注文一覧を取得
	            List<Order> orderList = dao.findAll();

	            // JSPに渡す
	            request.setAttribute("orderList", orderList);

	            // JSPへフォワード
	            request.getRequestDispatcher("/orderList.jsp").forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "注文一覧の取得に失敗しました");
	            request.getRequestDispatcher("/error.jsp").forward(request, response);
	        }*/
		//doGet(request, response);
	}

}
