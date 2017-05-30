package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.TruckVO;

public interface MypageDAO {
	List<TruckVO> truckList(String id, String foodtruckNumber);
	
}
