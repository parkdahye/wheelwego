package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.TruckVO;

public interface FoodTruckService {
	List<TruckVO> foodtruckList();
	List<TruckVO> searchFoodTruckList(String name);
	ListVO pagingTruckList(String pageNo);
	ListVO resultFoodTruckList(List<TruckVO> searchTruckList, String pageNo);
	List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo);
}
