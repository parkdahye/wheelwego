package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

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
	@Override
	public List<TruckVO> searchFoodTruckList(String name){
		return sqlSessionTemplate.selectList("foodtruck.searchFoodTruckList",name);
	}
	@Override
	public List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo) {
		return sqlSessionTemplate.selectList("foodtruck.searchFoodTruckByGPS", gpsInfo);
	}
}
