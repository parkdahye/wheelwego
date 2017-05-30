package org.asechs.wheelwego.model.vo;

public class TruckVO {
	private String foodtruckNumber;
	private String sellerId;
	private String foodtruckName;
	private String introduction;
	private String foodtruckFilename1;
	private String foodtruckFilename2;
	private String foodtruckFilename3;
	private double latitude;
	private double longitude;
	public TruckVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TruckVO(String foodtruckNumber, String sellerId, String foodtruckName, String introduction,
			String foodtruckFilename1, String foodtruckFilename2, String foodtruckFilename3, double latitude,
			double longitude) {
		super();
		this.foodtruckNumber = foodtruckNumber;
		this.sellerId = sellerId;
		this.foodtruckName = foodtruckName;
		this.introduction = introduction;
		this.foodtruckFilename1 = foodtruckFilename1;
		this.foodtruckFilename2 = foodtruckFilename2;
		this.foodtruckFilename3 = foodtruckFilename3;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public String getFoodtruckNumber() {
		return foodtruckNumber;
	}
	public void setFoodtruckNumber(String foodtruckNumber) {
		this.foodtruckNumber = foodtruckNumber;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getFoodtruckName() {
		return foodtruckName;
	}
	public void setFoodtruckName(String foodtruckName) {
		this.foodtruckName = foodtruckName;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getFoodtruckFilename1() {
		return foodtruckFilename1;
	}
	public void setFoodtruckFilename1(String foodtruckFilename1) {
		this.foodtruckFilename1 = foodtruckFilename1;
	}
	public String getFoodtruckFilename2() {
		return foodtruckFilename2;
	}
	public void setFoodtruckFilename2(String foodtruckFilename2) {
		this.foodtruckFilename2 = foodtruckFilename2;
	}
	public String getFoodtruckFilename3() {
		return foodtruckFilename3;
	}
	public void setFoodtruckFilename3(String foodtruckFilename3) {
		this.foodtruckFilename3 = foodtruckFilename3;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "TruckVO [foodtruckNumber=" + foodtruckNumber + ", sellerId=" + sellerId + ", foodtruckName="
				+ foodtruckName + ", introduction=" + introduction + ", foodtruckFilename1=" + foodtruckFilename1
				+ ", foodtruckFilename2=" + foodtruckFilename2 + ", foodtruckFilename3=" + foodtruckFilename3
				+ ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

	
}
