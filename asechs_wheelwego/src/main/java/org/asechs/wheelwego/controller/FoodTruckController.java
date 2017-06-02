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
}
