package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@Resource
	private MypageService mypageService;
	
	@RequestMapping("afterLogin_mypage/wishlist.do")
	// 세션이 없으면 홈으로 보냄
	public ModelAndView myWishList(HttpServletRequest request, String id, String pageNo) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return new ModelAndView("main_home.tiles");
		} else {
			// 세션에 해당하는 아이디의 wishlist정보를 가져옴.
			/*MemberVO sessionMemberVO = (MemberVO) session.getAttribute("memberVO");
			
			
			List<TruckVO> wishlist = mypageService.myWishList(sessionMemberVO.getId());
			for (int i = 0; i < wishlist.size(); i++)
				System.out.println(wishlist.get(i));
			return new ModelAndView("mypage/mypage_wishlist.tiles", "wishlist", wishlist);*/
			
			ModelAndView modelAndView = new ModelAndView("mypage/mypage_wishlist.tiles");
			ListVO listVO = mypageService.getWishList(pageNo, id);
			modelAndView.addObject("wishlist", listVO);
			
			System.out.println(listVO.getTruckList().size());
			
			modelAndView.addObject("id", id);	
			return modelAndView;
		}
		
/*		ModelAndView modelAndView = new ModelAndView("foodtruck/foodtruck_location_select_list.tiles");		
		ListVO listVO = foodTruckService.getFoodTruckListByName(pageNo, name);	
		modelAndView.addObject("pagingList", listVO);
		modelAndView.addObject("name", name);		
		
		System.out.println(name);
		System.out.println(listVO);
		return modelAndView;*/
	}
	
	@RequestMapping(value = "afterLogin_mypage/deleteWishList.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteWishList(String id, String foodtruckNumber){
		System.out.println(id + "," + foodtruckNumber);
		WishlistVO wishlistVO = new WishlistVO(foodtruckNumber, id);
		mypageService.deleteWishList(wishlistVO);
		return "success";
	}
	/**
	 * 판매자가
	 * 마이페이지로 이동할때
	 * 판매자 아이디에 해당하는 푸드트럭이  테이블에 존재하는지 검사하여
	 * 존재한다면 푸드트럭 정보를 같이 보내준다.
	 * @return
	 */	
	@RequestMapping("afterLogin_mypage/mypage.do")
	public ModelAndView showMyTruckpage(HttpServletRequest request){
		HttpSession session= request.getSession(false);
		ModelAndView mv=new ModelAndView("");
			MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
			String truckNumber=mypageService.findtruckNumberBySellerId(memberVO.getId());
				mv.addObject("truckNumber", truckNumber);
		mv.setViewName("mypage/mypage.tiles");
		return mv;
	}
	/**
	 * 판매자가 트럭을 등록하는 경우
	 * 파일 경로와 함께 트럭정보를 저장한다.
	 * @param truckVO
	 * @param request
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="afterLogin_mypage/registerFoodtruck.do")
	public String registerFoodtruck(TruckVO truckVO, HttpServletRequest request){
		MemberVO memberVO=(MemberVO)request.getSession(false).getAttribute("memberVO");
		truckVO.setSellerId(memberVO.getId());
		String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/"); 
		mypageService.registerFoodtruck(truckVO,uploadPath);
		return "mypage/registerMyfoodtruck_result.tiles";
	}
	/**
	 * 나의 푸드트럭 설정페이지이동
	 * 아이디에 일치하는 푸드트럭을 찾아서 정보를 함께 보낸다.
	 */
	@RequestMapping("afterLogin_mypage/myfoodtruck_page.do")
	public ModelAndView showMyFoodtruck(HttpServletRequest request){
		MemberVO memberVO=(MemberVO)request.getSession(false).getAttribute("memberVO");
		String truckNumber=mypageService.findtruckNumberBySellerId(memberVO.getId());
		TruckVO truckVO=mypageService.findtruckInfoByTruckNumber(truckNumber);
		return new ModelAndView("mypage/myfoodtruck_page.tiles","truckVO",truckVO);
	}
	/**
	 * 푸드트럭 정보를 업데이트
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="afterLogin_mypage/updateMyfoodtruck.do")
	public String updateMyfoodtruck(TruckVO truckVO, HttpServletRequest request){
		String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/"); 
		mypageService.updateMyfoodtruck(truckVO,uploadPath);
		return "mypage/myfoodtruck_page_result.tiles";
	}
	
	@RequestMapping("afterLogin_mypage/myfoodtruck_menuList.do")
	public ModelAndView showMenuList(HttpServletRequest request){
		MemberVO memberVO=(MemberVO)request.getSession(false).getAttribute("memberVO");
		String truckNumber=mypageService.findtruckNumberBySellerId(memberVO.getId());
		List<FoodVO> menuList=mypageService.showMenuList(truckNumber);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/myfoodtruck_menuList.tiles");
		mv.addObject("menuList", menuList);
		mv.addObject("truckNumber", truckNumber);
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST,value="afterLogin_mypage/registerMenuList.do")
	public String RegisterMenuList(HttpServletRequest request, TruckVO truckVO){
		MemberVO memberVO=(MemberVO)request.getSession(false).getAttribute("memberVO");
		String truckNumber=mypageService.findtruckNumberBySellerId(memberVO.getId());
		String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/"); 
		mypageService.registerMenuList(truckVO.getFoodList(),truckNumber,uploadPath);
		return"redirect:/afterLogin_mypage/myfoodtruck_menuList.do";
	}
	@RequestMapping("afterLogin_mypage/updateMenu.do")
	public String updateMenu(TruckVO truckVO, String sellerId,HttpServletRequest request){
		String foodtruckNumber=mypageService.findtruckNumberBySellerId(sellerId);
		truckVO.setFoodtruckNumber(foodtruckNumber);
		String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/"); 
		mypageService.updateMenu(truckVO,uploadPath);
		return "mypage/updateMenu_result.tiles";
	}
	
	@RequestMapping("afterLogin_mypage/deleteMyTruck.do")
	public String deleteMyTruck(String foodtruckNumber){
		mypageService.deleteMyTruck(foodtruckNumber);
		return "redirect:/afterLogin_mypage/mypage.do";
	}
	
	@RequestMapping("/afterLogin_mypage/showMyReviewList.do")
	public ModelAndView showMyReiviewList(String customerId, HttpServletRequest request){
		List<ReviewVO> reviewList=mypageService.showMyReviewList(customerId);
		return new ModelAndView("mypage/mypage_review.tiles","reviewList",reviewList);
	}
	@RequestMapping("afterLogin_mypage/mypage_review_update.do")
	public ModelAndView ReviewUpdateForm(String reviewNo){
		ReviewVO reviewVO=mypageService.findReviewInfoByReviewNo(reviewNo);
		return new ModelAndView("mypage/mypage_review_update.tiles","reviewVO",reviewVO);
	}
	@RequestMapping("afterLogin_mypage/deleteMyReview.do")
	@ResponseBody
	public String deleteMyReview(String reviewNo){
		mypageService.deleteMyReview(reviewNo);
		return "deleteOk";
	}
	@RequestMapping("afterLogin_mypage/updateMyReview.do")
	public String updateMyReview(ReviewVO reviewVO){
		mypageService.updateMyReview(reviewVO);
		return"redirect:/afterLogin_mypage/showMyReviewList.do?customerId="+reviewVO.getCustomerId();
	}
	@RequestMapping("afterLogin_mypage/checkTruckGPS.do")
	public ModelAndView checkTruckGPS(String sellerId){
		TruckVO gpsInfo = mypageService.getGPSInfo(sellerId);
		return new ModelAndView("mypage/checkTruckGPS.tiles","gpsInfo",gpsInfo);
	}
	@RequestMapping("afterLogin_mypage/setTruckGPS.do")
	public String setTruckGPS(String sellerId, String latitude, String longitude){
		System.out.println("실행됨");
		
		TruckVO gpsInfo = new TruckVO();
		
		gpsInfo.setSellerId(sellerId);
		
		if (latitude != null)
		{
			gpsInfo.setLatitude(Double.parseDouble(latitude));
			gpsInfo.setLongitude(Double.parseDouble(longitude));
		} 
		mypageService.setGPSInfo(gpsInfo);
		
		return "redirect:" + "/home.do";
	}	
	@RequestMapping("afterLogin_mypage/test.do")
	public String test(){
		return "mypage/test";
	}
	 @RequestMapping("afterLogin_mypage/showMyFoodtruck.do")
	   public ModelAndView showMyFoodtruck(String id){
	      String foodtruckNo=mypageService.findtruckNumberBySellerId(id);
	      return new ModelAndView("redirect:../foodtruck/foodTruckAndMenuDetail.do","foodtruckNo",foodtruckNo);
	   }
	@RequestMapping("afterLogin_mypage/checkFoodtruckNumber.do")
	@ResponseBody
	public boolean checkFoodtruckNumber(String foodtruckNumber){
		System.out.println(foodtruckNumber);
		TruckVO truckVO=mypageService.findtruckInfoByTruckNumber(foodtruckNumber);
		System.out.println(truckVO);
		if(truckVO==null)
			return false;
		else
			return true;
	}
}