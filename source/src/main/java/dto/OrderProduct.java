package dto;
import java.io.Serializable;
public class OrderProduct implements Serializable {
	
	private int orderedProductId;
	private int orderId;
	private int productId;
	private int pieces;
	public int getOrderedProductId() {
		return orderedProductId;
	}
	public void setOrderedProductId(int orderedProductId) {
		this.orderedProductId = orderedProductId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getPieces() {
		return pieces;
	}
	public void setPieces(int pieces) {
		this.pieces = pieces;
	}
	public OrderProduct() {
		this(0,0,0,0);
	}
	
	public OrderProduct(int orderedProductId, int orderId, int productId, int pieces) {
		super();
		this.orderedProductId = orderedProductId;
		this.orderId = orderId;
		this.productId = productId;
		this.pieces = pieces;
	}
	
}
