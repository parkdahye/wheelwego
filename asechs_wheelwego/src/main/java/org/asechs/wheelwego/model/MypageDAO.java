package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;

public interface MypageDAO {
	public List<WishlistVO> myWishList(String id);
	
	public void deleteWishList(WishlistVO wishlistVO);

	void registerFoodtruck(TruckVO tvo);
	
	TruckVO findtruckInfoByTruckNumber(String truckNumber); //트럭번호로 트럭정보찾기

	String findtruckNumberBySellerId(String sellerId); //아이디로 트럭넘버 찾기
	
	void saveFilePath(FileVO fileVO); //파일경로저장하기

	void updateMyfoodtruck(TruckVO truckVO); //푸드트럭 설정 수정

	void updateFilePath(FileVO fileVO); //파일경로 수정

	List<FoodVO> showMenuList(String truckNumber); //트럭넘버에 해당하는 메뉴리스트 보기

	void deleteAllMenu(String truckNumber); //트럭넘버에 해당하는 모든 메뉴 삭제하기

	void deleteMenu(String menuId); //메뉴아이디에 해당하는 메뉴지우기
	
	void registerMenu(FoodVO foodVO); //메뉴등록하기
	
	void updateMenu(FoodVO foodVO); //메뉴 수정하기
	
	FoodVO findMenuByMenuId(String menuId);
	
	void updateMenuFilepath(FileVO fileVO);

	void deleteMyTruck(String foodtruckNumber);
}
