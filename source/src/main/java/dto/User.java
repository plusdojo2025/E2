package dto;
import java.io.Serializable;
import java.time.LocalDateTime;
public class User implements Serializable {
	
	private int userId;
	private String userName;
	private String password;
	private String config;
	private String orderUrl;
	private LocalDateTime createdAt;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfig() {
		return config;
	}
	public void setConfig(String config) {
		this.config = config;
	}
	public String getOrderUrl() {
		return orderUrl;
	}
	public void setOrderUrl(String orderUrl) {
		this.orderUrl = orderUrl;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	public User() {
		this(0,"","","","",null);
	}
	
	public User(int userId, String userName, String password, String config, String orderUrl, LocalDateTime createdAt) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.config = config;
		this.orderUrl = orderUrl;
		this.createdAt = createdAt;
	}
	
}