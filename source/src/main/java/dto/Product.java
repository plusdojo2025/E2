package dto;
import java.io.Serializable;
public class Product implements Serializable {

	private int productId;
	private String productName;
	private int price;
	private boolean isSoldOut;
	private String productDetail;
	private String imageUrl;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isSoldOut() {
		return isSoldOut;
	}
	public void setSoldOut(boolean isSoldOut) {
		this.isSoldOut = isSoldOut;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public Product() {
		this(0,"",0,false,"","");
	}
	
	public Product(int productId, String productName, int price, boolean isSoldOut,
			String productDetail, String imageUrl) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.isSoldOut = isSoldOut;
		this.productDetail = productDetail;
		this.imageUrl = imageUrl;
	}
	
}
