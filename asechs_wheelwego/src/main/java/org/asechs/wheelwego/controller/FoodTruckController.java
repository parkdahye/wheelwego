package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.FoodTruckService;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodTruckController {
	@Resource
	private FoodTruckService foodTruckService;

	/*
	 * @RequestMapping("foodtruckList.do") public ModelAndView foodtruckList() {
	 * List<TruckVO> randomFoodList = foodTruckService.foodtruckList(); return
	 * new ModelAndView("main_home.tiles", "foodVO", randomFoodList); }
	 */
	@RequestMapping(value = "searchFoodTruckList.do", method = RequestMethod.POST)
	public ModelAndView searchFoodTruckList(String name) {
		List<TruckVO> searchTruckList = foodTruckService.searchFoodTruckList(name);
		return new ModelAndView("foodtruck/foodtruck_detail.tiles", "truckList", searchTruckList);
	}
	
	
	/**
	 * 황윤상 GPS 기반 푸드트럭수동검색
	 * @param name
	 * @return
	 */
	@RequestMapping("searchFoodTruckByGPS.do")
	public ModelAndView searchFoodTruckByGPS(String latitude, String longitude, String name) {
		TruckVO gpsInfo = new TruckVO();
		gpsInfo.setLatitude(Double.parseDouble(latitude));
		gpsInfo.setLongitude(Double.parseDouble(longitude));
		List<TruckVO> searchTruckList = null;
		
		if (name != "")
			searchTruckList = foodTruckService.searchFoodTruckList(name);
			
		else
			searchTruckList = foodTruckService.searchFoodTruckByGPS(gpsInfo);

			
		
		return new ModelAndView("foodtruck/foodtruck_detail.tiles", "truckList", searchTruckList);
	}	
}
