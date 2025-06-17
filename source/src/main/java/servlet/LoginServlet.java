package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
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
		String name = request.getParameter("name");
		String pw = request.getParameter("password");
		String btn = request.getParameter("submit");

        // 入力チェック
        if (name == null || name.isEmpty() || pw == null || pw.isEmpty()) {
            request.setAttribute("error", "名前とパスワードを入力してください。");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }

		// データベースを検索して結果をリクエストスコープに格納
		if(name != "" && pw != "") {
			UsersDAO dao = new UsersDAO();
			int userId = dao.authenticate(name, pw);

			//ログインボタン
			if(btn.equals("ログイン")) {
				if(userId != 0) {
					System.out.println("アカウントが見つかりました。");
					HttpSession session = request.getSession();
					session.setAttribute("user_id", userId);
					session.setAttribute("user_name", name);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
					dispatcher.forward(request, response);
				}else { // 一致するユーザーが見つからなかった場合
		            request.setAttribute("error", "名前またはパスワードが違います。");
		            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
				}
				
			//新規登録ボタン
			} else if (btn.equals("新規作成")) {
				if(userId != 0) {
					System.out.println("利用できないアカウント名");
		            request.setAttribute("error", "利用できないアカウント名です。");
		            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
				}else { // 一致するユーザーが見つからなかった場合
					if(dao.insert(name, pw, "", "")) {
						System.out.println("ユーザー登録完了");
						HttpSession session = request.getSession();
						session.setAttribute("user_id", userId);
						session.setAttribute("user_name", name);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
						dispatcher.forward(request, response);
					} else {
						System.out.println("ユーザー登録失敗");
						RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
