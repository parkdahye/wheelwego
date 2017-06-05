package org.asechs.wheelwego.controller;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.FoodTruckService;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodTruckController {
	@Resource
	private FoodTruckService foodTruckService;

	/* 검색 결과 푸드트럭 리스트 */
	@RequestMapping("searchFoodTruckByName.do")
	public ModelAndView searchFoodTruckByName(String name, String pageNo, String latitude, String longitude) {
		ModelAndView modelAndView = new ModelAndView("foodtruck/foodtruck_location_select_list.tiles");		
		ListVO listVO = foodTruckService.getFoodTruckListByName(pageNo, name);	
		modelAndView.addObject("pagingList", listVO);
		modelAndView.addObject("name", name);		
		return modelAndView;
	}
	
	/**
	 * 황윤상 GPS 기반 푸드트럭수동검색
	 * @param name
	 * @return
	 */
	@RequestMapping("searchFoodTruckByGPS.do")
	public ModelAndView searchFoodTruckByGPS(String latitude, String longitude, String pageNo) {
		TruckVO gpsInfo = new TruckVO();
		gpsInfo.setLatitude(Double.parseDouble(latitude));
		gpsInfo.setLongitude(Double.parseDouble(longitude));
		
		ModelAndView modelAndView = new ModelAndView("foodtruck/foodtruck_location_select_list.tiles");	
		//ListVO listVO = foodTruckService.resultFoodTruckList(pageNo,name);		

		
		
		/*
		System.out.println(name);
		
		if (name != null)
			searchTruckList = foodTruckService.searchFoodTruckList(name);
			
		else
			searchTruckList = foodTruckService.searchFoodTruckByGPS(gpsInfo);*/

			
		
		return new ModelAndView("foodtruck/foodtruck_location_select_list.tiles", "truckList", null);
	}	

	/**
	 * 정현지 푸드트럭 상세보기
	 * @param foodtruck_number
	 * @return TruckVO
	 */
	@RequestMapping("foodTruckAndMenuDetail.do")
	public ModelAndView foodTruckAndMenuDetail(String foodtruckNo){
		TruckVO truckDetail = foodTruckService.foodTruckAndMenuDetail(foodtruckNo);
		System.out.println(truckDetail);
		return new ModelAndView("foodtruck/foodtruck_detail.tiles","truckDetailInfo",truckDetail);
	}
}
