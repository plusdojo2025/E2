package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.OrderProduct;

public class OrderProductsDAO extends SuperDAO{
	
	public List<OrderProduct> getOrderProductData(int orderProductId){
		
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();

		Connection conn = null;

		try {
			// JDBCドライバ読み込み
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベース接続
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL作成
			String sql = "SELECT * FROM ordered_products WHERE ordered_product_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setInt(1, orderProductId);

			// SQLを実行して検索結果を取得
			ResultSet r = pStmt.executeQuery();

			// 検索結果をコレクションに格納
			while (r.next()) { // 結果がある場合のみオブジェクトを生成
				OrderProduct orderProduct = new OrderProduct(r.getInt("ordered_product_id"),r.getInt("order_id"),r.getInt("product_id"),r.getInt("pieces"));
				orderProductList.add(orderProduct);
			}
			
			r.close();
			pStmt.close();

			// 検索結果が格納されたコレクションを返す
			return orderProductList;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}