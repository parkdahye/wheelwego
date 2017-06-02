package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
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

	/* pagingBean 적용된 검색 결과 푸드트럭 리스트 */
	@Override
	public List<TruckVO> pagingTruckList(PagingBean pagingBean){
		return sqlSessionTemplate.selectList("foodtruck.pagingTruckList",pagingBean);
	}
	@Override
	public int getTruckListTotalContentCount() {
		return sqlSessionTemplate.selectOne("foodtruck.getTruckListTotalContentCount");
	}

	@Override
	public List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo) {
		return sqlSessionTemplate.selectList("foodtruck.searchFoodTruckByGPS", gpsInfo);
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
}
