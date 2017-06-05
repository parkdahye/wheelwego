package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;

public interface FoodTruckDAO {
	List<TruckVO> foodtruckList();
	List<TruckVO> searchFoodTruckList(String name);
	List<TruckVO> pagingTruckList(PagingBean pagingBean);
	int getTruckListTotalContentCount();
	List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo);
	TruckVO foodtruckDetail(String foodtruckNo);
	List<FoodVO> foodListDetail(String foodtruckNo);
	void registerReview(ReviewVO reviewVO);
	List<ReviewVO> getReviewListByTruckNumber(PagingBean pagingBean);
	int getReivewTotalCount(String foodtruckNumber);
	int getAvgGradeByTruckNumber(String foodtruckNumber);
	int findTruckNumberInReview(String foodtruckNumber);
}
