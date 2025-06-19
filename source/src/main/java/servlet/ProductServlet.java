package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDAO;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/product.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//文字コード設定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータ取得
		String productName = request.getParameter("product_name");
		int price = Integer.parseInt(request.getParameter("price"));
		int allergy = Integer.parseInt(request.getParameter("allergy"));
		String productDetail = request.getParameter("product_detail");
		String imageUrl = request.getParameter("imageUrl");
		String btn = request.getParameter("submit");

   	 	ProductsDAO dao = new ProductsDAO();
   	 
		if(btn.equals("追加")) {
	        // 入力チェック
	        if (productName == null || productName.isEmpty() || productDetail == null || productDetail.isEmpty()) {
	            request.setAttribute("error", "商品名と商品詳細を入力してください。");
	            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
	            return;
	        } else {
	        	 // データ登録
	        	 if(dao.insert(productName, price, 0, allergy, productDetail, imageUrl)) {
	        		 System.out.println("商品登録完了");
	        	 } else {
	        		 System.out.println("商品登録失敗");
	        	 }
	        }
		} else if(btn.equals("削除")) {
			int productId = Integer.parseInt(request.getParameter("priduct_id"));
			if(dao.delete(productId)) {
				System.out.println("削除完了");
			} else {
				System.out.println("削除失敗");
			}
		}
		
		doGet(request, response);
	}

}