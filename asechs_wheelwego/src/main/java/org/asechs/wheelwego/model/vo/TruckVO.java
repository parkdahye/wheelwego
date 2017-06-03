package org.asechs.wheelwego.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TruckVO {
	private String foodtruckNumber;
	private String sellerId;
	private String foodtruckName;
	private String introduction;
	private MultipartFile foodtruckFile; // 웹에서 이미지 받아오기 위한 변수 (coulmn X)
	private FileVO fileVO;
	private List<FoodVO> foodList;
	private double latitude;
	private double longitude;

	public TruckVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TruckVO(String foodtruckNumber, String sellerId, String foodtruckName, String introduction,
			MultipartFile foodtruckFile, FileVO fileVO, List<FoodVO> foodList, double latitude, double longitude) {
		super();
		this.foodtruckNumber = foodtruckNumber;
		this.sellerId = sellerId;
		this.foodtruckName = foodtruckName;
		this.introduction = introduction;
		this.foodtruckFile = foodtruckFile;
		this.fileVO = fileVO;
		this.foodList = foodList;
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

	public MultipartFile getFoodtruckFile() {
		return foodtruckFile;
	}

	public void setFoodtruckFile(MultipartFile foodtruckFile) {
		this.foodtruckFile = foodtruckFile;
	}

	public FileVO getFileVO() {
		return fileVO;
	}

	public void setFileVO(FileVO fileVO) {
		this.fileVO = fileVO;
	}

	public List<FoodVO> getFoodList() {
		return foodList;
	}

	public void setFoodList(List<FoodVO> foodList) {
		this.foodList = foodList;
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
				+ foodtruckName + ", introduction=" + introduction + ", foodtruckFile=" + foodtruckFile + ", fileVO="
				+ fileVO + ", foodList=" + foodList + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}


}
