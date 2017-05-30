package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.TruckVO;

public interface FoodTruckService {
	List<TruckVO> foodtruckList();
	List<TruckVO> searchFoodTruckList(String name);
}
