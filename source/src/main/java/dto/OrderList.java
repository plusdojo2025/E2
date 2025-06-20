package dto;
import java.io.Serializable;
import java.util.List;
public class OrderList implements Serializable {
	
	private String orderCode;
	private int totalAmount;
	private int isPaid;
	private int isComplete;
	private int isHanded;
	private List<String> productName;
	private List<Integer> piece;
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getIsPaid() {
		return isPaid;
	}
	public void setIsPaid(int isPaid) {
		this.isPaid = isPaid;
	}
	public int getIsComplete() {
		return isComplete;
	}
	public void setIsComplete(int isComplete) {
		this.isComplete = isComplete;
	}
	public int getIsHanded() {
		return isHanded;
	}
	public void setIsHanded(int isHanded) {
		this.isHanded = isHanded;
	}
	public List<String> getProductName() {
		return productName;
	}
	public void setProductName(List<String> productName) {
		this.productName = productName;
	}
	public List<Integer> getPiece() {
		return piece;
	}
	public void setPiece(List<Integer> piece) {
		this.piece = piece;
	}
	public OrderList(String orderCode, int totalAmount, int isPaid, int isComplete, int isHanded,
			List<String> productName, List<Integer> piece) {
		super();
		this.orderCode = orderCode;
		this.totalAmount = totalAmount;
		this.isPaid = isPaid;
		this.isComplete = isComplete;
		this.isHanded = isHanded;
		this.productName = productName;
		this.piece = piece;
	}
	
	
}
