package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Order;

public class OrdersDAO extends SuperDAO{
	
	public List<Order> getDataAll(){
		
		List<Order> orderList = new ArrayList<Order>();

		Connection conn = null;

		try {
			// JDBCドライバ読み込み
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベース接続
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL作成
			String sql = "SELECT * FROM orders";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// SQLを実行して検索結果を取得
			ResultSet r = pStmt.executeQuery();

			// 検索結果をコレクションに格納
			while (r.next()) { // 結果がある場合のみオブジェクトを生成
				Order order = new Order(r.getInt("order_id"),r.getString("order_code"),r.getBoolean("is_paid"),r.getBoolean("is_complete"),r.getBoolean("is_handed"),r.getInt("total_amount"));
				orderList.add(order);
			}
			
			r.close();
			pStmt.close();

			// 検索結果が格納されたコレクションを返す
			return orderList;
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
	
	//注文登録
	public boolean insert(String orderCode, int totalAmount) {

		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "INSERT INTO orders (order_code, is_paid, is_complete, is_handed, total_amount) VALUES (?, 0, 0, 0, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setString(1, orderCode);
			pStmt.setInt(2, totalAmount);
			
			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
			
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
	
	public int[] getFlag(int orderId) {
	    String sql = "SELECT is_paid, is_complete, is_handed FROM orders WHERE order_id = ?";
	    try (
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");
	        PreparedStatement ps = conn.prepareStatement(sql)
	    ) {
	        ps.setInt(1, orderId);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                int paid     = rs.getInt("is_paid");
	                int complete = rs.getInt("is_complete");
	                int handed   = rs.getInt("is_handed");
	                return new int[]{ paid, complete, handed };
	            } else {
	                // 該当 order_id がない場合はデフォルト返却
	                return new int[]{ 0, 0, 0 };
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // エラー時にも必ず長さ3の配列を返すか null を扱うように呼び出し側で対応
	        return new int[]{ 0, 0, 0 };
	    }
	}
}