package dto;

import java.util.Map;

public class OrderDTO {
    private int orderId;
    private int totalAmount;
    private boolean isPaid;
    private boolean isComplete;
    private boolean isHanded;
    private Map<String, Integer> productQuantities; // 商品名 → 個数

    // Getter/Setter
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getTotalAmount() { return totalAmount; }
    public void setTotalAmount(int totalAmount) { this.totalAmount = totalAmount; }

    public boolean isPaid() { return isPaid; }
    public void setPaid(boolean isPaid) { this.isPaid = isPaid; }

    public boolean isComplete() { return isComplete; }
    public void setComplete(boolean isComplete) { this.isComplete = isComplete; }

    public boolean isHanded() { return isHanded; }
    public void setHanded(boolean isHanded) { this.isHanded = isHanded; }

    public Map<String, Integer> getProductQuantities() { return productQuantities; }
    public void setProductQuantities(Map<String, Integer> productQuantities) {
        this.productQuantities = productQuantities;
    }
}