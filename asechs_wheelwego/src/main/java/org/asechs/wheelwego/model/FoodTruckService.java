package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;

public interface FoodTruckService {
	List<TruckVO> foodtruckList();
	List<TruckVO> searchFoodTruckList(String name);
	List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo);
	TruckVO foodTruckAndMenuDetail(String foodtruckNo);
	void registerReview(ReviewVO reviewVO);
	ListVO getReviewListByTruckNumber(String reviewPageNo, String foodTruckNumber);
	public ListVO getFoodTruckListByName(String pageNo, String name);
	int getAvgGradeByTruckNumber(String foodtruckNumber);
}
