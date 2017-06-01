package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Service;

@Service
public class FoodTruckServiceImpl implements FoodTruckService {
	@Resource
	private FoodTruckDAO foodTruckDAO;

	@Override
	public List<TruckVO> foodtruckList() {
		return foodTruckDAO.foodtruckList();
	}

	@Override
	public List<TruckVO> searchFoodTruckList(String name){
		return foodTruckDAO.searchFoodTruckList(name);
	}

	@Override
	public List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo) {
		return foodTruckDAO.searchFoodTruckByGPS(gpsInfo);
	}
}
