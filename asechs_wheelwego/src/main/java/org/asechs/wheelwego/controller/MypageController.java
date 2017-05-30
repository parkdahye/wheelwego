	package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@Resource
	private MypageService mypageService;
	@RequestMapping("afterLogin_mypage/wishlist.do")
	public ModelAndView showWishList(HttpServletRequest request,String id,String truckNumber){
		HttpSession session=request.getSession(false);
		if(session==null){
			return new ModelAndView("main_home.tiles");
		}else{
			ModelAndView mv=new ModelAndView();
			List<TruckVO>truckList=mypageService.getTruckList(id, truckNumber);
			mv.addObject("truckList",truckList);
		}
		return new ModelAndView();
	}
}