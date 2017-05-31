package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.TruckVO;

public interface MypageService {

	List<TruckVO> getTruckList(String id, String trucknumber);
	
}