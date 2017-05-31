	package org.asechs.wheelwego.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;
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
	
	/**
	 * 판매자가
	 * 마이페이지에 있는 나의 푸드트럭 설정으로 갈 때 
	 * 푸드트럭 설정정보를 함께 보내준다.
	 * @return
	 */
	@RequestMapping("afterLogin_mypage/mypage.do")
	public ModelAndView showMyTruckpage(HttpServletRequest request){
		HttpSession session= request.getSession(false);
		ModelAndView mv=new ModelAndView("");
		if(session!=null && session.getAttribute("memberVO")!=null){
			TruckVO truckVO=mypageService.showMyTruckpage((MemberVO)session.getAttribute("memberVO"));
			mv.addObject("truckVO", truckVO);
			System.out.println("TRUCKVO"+truckVO);
		}
		mv.setViewName("mypage/mypage.tiles");
		return mv;
	}
}