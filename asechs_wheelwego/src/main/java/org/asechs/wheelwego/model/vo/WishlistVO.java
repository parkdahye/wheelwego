package org.asechs.wheelwego.model.vo;

public class WishlistVO {
	private String foodTruckNumber;
	private String customerId;
	public WishlistVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WishlistVO(String foodTruckNumber, String customerId) {
		super();
		this.foodTruckNumber = foodTruckNumber;
		this.customerId = customerId;
	}
	public String getFoodTruckNumber() {
		return foodTruckNumber;
	}
	public void setFoodtruckNumber(String foodTruckNumber) {
		this.foodTruckNumber = foodTruckNumber;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	@Override
	public String toString() {
		return "WishlistVO [foodtruckNumber=" + foodTruckNumber + ", customerId=" + customerId + "]";
	}
}
