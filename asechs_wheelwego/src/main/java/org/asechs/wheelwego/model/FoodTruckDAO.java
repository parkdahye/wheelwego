package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;

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
	void registerBookMark(WishlistVO wishlistVO);
	int getBookMarkCount(WishlistVO wishlistVO);
}
