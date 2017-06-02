package org.asechs.wheelwego.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class FoodVO {
	private String  menuId;
	private String foodTruckNumber;
	private String menuName;
	private int menuPrice;
	private MultipartFile menuFile; //이미지를 받을 변수
	private FileVO fileVO;
	
	public FoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodVO(String menuId, String foodTruckNumber, String menuName, int menuPrice, MultipartFile menuFile,
			FileVO fileVO) {
		super();
		this.menuId = menuId;
		this.foodTruckNumber = foodTruckNumber;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuFile = menuFile;
		this.fileVO = fileVO;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getFoodTruckNumber() {
		return foodTruckNumber;
	}

	public void setFoodTruckNumber(String foodTruckNumber) {
		this.foodTruckNumber = foodTruckNumber;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public MultipartFile getMenuFile() {
		return menuFile;
	}

	public void setMenuFile(MultipartFile menuFile) {
		this.menuFile = menuFile;
	}

	public FileVO getFileVO() {
		return fileVO;
	}

	public void setFileVO(FileVO fileVO) {
		this.fileVO = fileVO;
	}

	@Override
	public String toString() {
		return "FoodVO [menuId=" + menuId + ", foodTruckNumber=" + foodTruckNumber + ", menuName=" + menuName
				+ ", menuPrice=" + menuPrice + ", menuFile=" + menuFile + ", fileVO=" + fileVO + "]";
	}


}
