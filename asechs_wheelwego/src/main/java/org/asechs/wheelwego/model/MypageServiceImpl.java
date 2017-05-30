package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	@Resource
	private FoodTruckDAO foodtruckDAO;
	@Override
	public List<TruckVO> getTruckList(String id,String trucknumber) {
		
		return foodtruckDAO.truckList("truck.getTruckList",id,trucknumber);
	}
	

}
