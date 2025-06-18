package dto;
import java.io.Serializable;
import java.time.LocalDateTime;
public class Order implements Serializable {

	private int orderId;
	private int userId;
	private String orderCode;
	private boolean isPaid;
	private boolean isComplete;
	private boolean isHanded;
	private int totalAmount;
	private LocalDateTime createdAt;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUrderCode() {
		return orderCode;
	}
	public void setUrderCode(String orderCode) { //urderCodeになっていたためorderCodeに変更by中村
		this.orderCode = orderCode;
	}
	public boolean isPaid() {
		return isPaid;
	}
	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}
	public boolean isComplete() {
		return isComplete;
	}
	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}
	public boolean isHanded() {
		return isHanded;
	}
	public void setHanded(boolean isHanded) {
		this.isHanded = isHanded;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	public Order() {
		this(0,0,"",false,false,false,0,null);
	}
	
	public Order(int orderId, int userId, String orderCode, boolean isPaid, boolean isComplete, boolean isHanded,
			int totalAmount, LocalDateTime createdAt) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderCode = orderCode;
		this.isPaid = isPaid;
		this.isComplete = isComplete;
		this.isHanded = isHanded;
		this.totalAmount = totalAmount;
		this.createdAt = createdAt;
	}
	
}
