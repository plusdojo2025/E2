package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dto.Product;

public class ProductsDAO {
	
	public List<Product> getProductData(int productId){
		
		List<Product> productList = new ArrayList<Product>();

		Connection conn = null;

		try {
			// JDBCドライバ読み込み
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベース接続
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL作成
			String sql = "SELECT * FROM Products WHERE product_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setInt(1, productId);

			// SQLを実行して検索結果を取得
			ResultSet r = pStmt.executeQuery();

			// 検索結果をコレクションに格納
			while (r.next()) { // 結果がある場合のみオブジェクトを生成
				Product product = new Product(r.getInt("product_id"),r.getInt("user_id"),r.getString("product_name"),r.getInt("price"),r.getBoolean("is_sold_out"),r.getInt("allergy"),r.getString("product_detail"),r.getString("image_url"),r.getObject("created_at",LocalDateTime.class));
				productList.add(product);
			}
			
			r.close();
			pStmt.close();

			// 検索結果が格納されたコレクションを返す
			return productList;
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