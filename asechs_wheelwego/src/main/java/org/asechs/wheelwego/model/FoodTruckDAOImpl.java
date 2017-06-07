package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FoodTruckDAOImpl implements FoodTruckDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TruckVO> foodtruckList() {
		return sqlSessionTemplate.selectList("foodtruck.foodtruckList");
	}

	/* 검색 결과 푸드트럭 리스트 */
	@Override
	public List<TruckVO> searchFoodTruckList(String name) {
		return sqlSessionTemplate.selectList("foodtruck.searchFoodTruckList", name);
	}

	@Override
	public int getTruckListTotalContentCount(String name) {
		return sqlSessionTemplate.selectOne("foodtruck.getTruckListTotalContentCount", name);
	}

	@Override
	public List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo) {
		return sqlSessionTemplate.selectList("foodtruck.searchFoodTruckByGPS", gpsInfo);
	}

	/* foodtruck 정보 상세보기 */
	@Override
	public TruckVO foodtruckDetail(String foodtruckNo) {
		return sqlSessionTemplate.selectOne("foodtruck.foodtruckDetail", foodtruckNo);
	}

	/* foodtruck 상세보기에 들어갈 menu list */
	@Override
	public List<FoodVO> foodListDetail(String foodtruckNo) {
		return sqlSessionTemplate.selectList("foodtruck.foodListDetail", foodtruckNo);
	}

	@Override
	public void registerReview(ReviewVO reviewVO) {
		sqlSessionTemplate.insert("foodtruck.registerReview", reviewVO);
	}

	@Override
	public List<ReviewVO> getReviewListByTruckNumber(PagingBean pagingBean) {
		return sqlSessionTemplate.selectList("foodtruck.getReviewListByTruckNumber", pagingBean);
	}

	@Override
	public int getReivewTotalCount(String foodtruckNumber) {
		return sqlSessionTemplate.selectOne("foodtruck.getReivewTotalCount",foodtruckNumber);
	}
	@Override
	public void registerBookMark(WishlistVO wishlistVO) {
		sqlSessionTemplate.insert("foodtruck.registerBookMark", wishlistVO);
		
	}
	@Override
	public int getBookMarkCount(WishlistVO wishlistVO) {
		
		return sqlSessionTemplate.selectOne("foodtruck.getBookMarkCount",wishlistVO);
	}

	@Override
	public List<TruckVO> getFoodTruckListByName(PagingBean pagingBean) {
		return sqlSessionTemplate.selectList("foodtruck.getFoodTruckListByName",pagingBean);
	}
	
	@Override
	public int getAvgGradeByTruckNumber(String foodtruckNumber) {
		return sqlSessionTemplate.selectOne("foodtruck.getAvgGradeByTruckNumber", foodtruckNumber);
	}
	@Override
	public int findTruckNumberInReview(String foodtruckNumber) {
		return sqlSessionTemplate.selectOne("foodtruck.findTruckNumberInReview", foodtruckNumber);
	}

	@Override
	public List<TruckVO> filteringByRegisterDate(PagingBean pagingbean) {
		return sqlSessionTemplate.selectList("foodtruck.filteringByRegisterDate", pagingbean);
	}

	@Override
	public List<TruckVO> filteringByWishlistCount(PagingBean pagingbean) {
		return sqlSessionTemplate.selectList("foodtruck.filteringByWishlistCount", pagingbean);
	}

	@Override
	public List<TruckVO> filteringByAvgGrade(PagingBean pagingbean) {
		return sqlSessionTemplate.selectList("foodtruck.filteringByAvgGrade", pagingbean);
	}

	@Override
	public int findAvgGradeByTruckNumber(String truckNumber) {
		return sqlSessionTemplate.selectOne("foodtruck.findAvgGradeByTruckNumber", truckNumber);
	}

	@Override
	public int findWishlistCountByTruckNumber(String foodtruckNumber) {
		return sqlSessionTemplate.selectOne("foodtruck.findWishlistCountByTruckNumber", foodtruckNumber);
	}
}
