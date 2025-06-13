package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dto.User;

public class UsersDAO extends SuperDAO{
	
	public List<User> getUserData(int userId){
		
		List<User> userList = new ArrayList<User>();

		Connection conn = null;

		try {
			// JDBCドライバ読み込み
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベース接続
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL作成
			String sql = "SELECT * FROM users WHERE user_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setInt(1, userId);

			// SQLを実行して検索結果を取得
			ResultSet r = pStmt.executeQuery();

			// 検索結果をコレクションに格納
			while (r.next()) { // 結果がある場合のみオブジェクトを生成
				User user = new User(r.getInt("user_id"),r.getString("user_name"),r.getString("password"),r.getString("config"),r.getString("order_url"),r.getObject("created_at",LocalDateTime.class));
				userList.add(user);
			}
			
			r.close();
			pStmt.close();

			// 検索結果が格納されたコレクションを返す
			return userList;
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
	
	//ユーザー登録
	public boolean insert(String userName, String password, String config, String orderUrl) {

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
			String sql = "INSERT INTO users (user_name, password, config, order_url) VALUES (?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			pStmt.setString(1, userName);
			pStmt.setString(2, password);
			pStmt.setString(3, config);
			pStmt.setString(4, orderUrl);
			
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
	
	// ユーザー認証
    public boolean authenticate(String userName, String password) {
		Connection conn = null;
        try {
			// データベース接続
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");
            String sql = "SELECT * FROM users WHERE user_name=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
