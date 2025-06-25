package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.OrdersDAO;

@WebServlet("/HandedUpdate")
public class HandedUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final OrdersDAO ordersDAO = new OrdersDAO();
	private final Gson gson = new Gson();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderIdStr = req.getParameter("orderId");
		resp.setContentType("application/json; charset=UTF-8");
		JsonObject json = new JsonObject();

		try {
			int orderId = Integer.parseInt(orderIdStr);
			// DAO でフラグ配列を取得 (0 or 1 の配列が３つ)
			int[] flags = ordersDAO.getFlag(orderId);
			// JSON に格納

			if (flags == null) {
				flags = new int[] { 0, 0, 0 };
			}
			json.addProperty("success", true);
			json.add("flags", gson.toJsonTree(flags));
		} catch (Exception e) {
			json.addProperty("success", false);
			json.add("flags", gson.toJsonTree(new int[]{0,0,0}));
			json.addProperty("error", e.getMessage());
		}

		try (var out = resp.getWriter()) {
			out.print(gson.toJson(json));
		}
	}
}
