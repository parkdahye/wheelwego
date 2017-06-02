package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.PagingBean;
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
	/* 검색 결과 푸드트럭 리스트 */
	@Override
	public List<TruckVO> searchFoodTruckList(String name){
		return foodTruckDAO.searchFoodTruckList(name);
	}
	/* pagingBean 적용된 검색 결과 푸드트럭 리스트 */
	@Override
	public ListVO pagingTruckList(String pageNo){
		int totalCount = foodTruckDAO.getTruckListTotalContentCount();
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount,1);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		ListVO list = new ListVO();
		list.setTruckList(foodTruckDAO.pagingTruckList(pagingBean));
		list.setPagingBean(pagingBean);
		return list;
	}

	@Override
	public ListVO resultFoodTruckList(List<TruckVO> searchTruckList, String pageNo) {
		int totalCount=foodTruckDAO.getTruckListTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount,1);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		ListVO list = new ListVO();
		list.setTruckList(searchTruckList);
		list.setPagingBean(pagingBean);
		return list;
	}
}
