package dto;
import java.io.Serializable;
import java.time.LocalDateTime;
public class Product implements Serializable {

	private int productId;
	private int userId;
	private String productName;
	private int price;
	private boolean isSoldOut;
	private int allergy;
	private String productDetail;
	private String imageUrl;
	private LocalDateTime createdAt;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public int getAllergy() {
		return allergy;
	}
	public void setAllergy(int allergy) {
		this.allergy = allergy;
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
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	public Product() {
		this(0,0,"",0,false,0,"","",null);
	}
	
	public Product(int productId, int userId, String productName, int price, boolean isSoldOut, int allergy,
			String productDetail, String imageUrl, LocalDateTime createdAt) {
		super();
		this.productId = productId;
		this.userId = userId;
		this.productName = productName;
		this.price = price;
		this.isSoldOut = isSoldOut;
		this.allergy = allergy;
		this.productDetail = productDetail;
		this.imageUrl = imageUrl;
		this.createdAt = createdAt;
	}
	
}
