	package org.asechs.wheelwego.controller;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.MypageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@Resource
	private MypageService mypageService;
	@RequestMapping("afterLogin_mypage/wishlist.do")
	public ModelAndView showWishList(){
		return new ModelAndView();
	}
}