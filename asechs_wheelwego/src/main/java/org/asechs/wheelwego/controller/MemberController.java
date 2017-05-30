package org.asechs.wheelwego.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.MemberService;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	//박다혜 Login
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, MemberVO vo) {		
		MemberVO memberVO=memberService.login(vo);
		if(memberVO==null)
			return "member/login_fail";
		else{
			HttpSession session=request.getSession();
			session.setAttribute("memberVO",memberVO);
			return "main_home.tiles";
		}
	}
	//박다혜 logout
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return "main_home.tiles";
	}
	//정현지 id찾기
	@RequestMapping("forgetMemberId.do")
	 @ResponseBody
	   public String forgetMemberId(MemberVO vo) {
	      return memberService.forgetMemberId(vo);
	   }
	//정현지 pw찾기
	   @RequestMapping("forgetMemberPassword.do")
	   @ResponseBody
	   public String forgetMemberPassword(MemberVO vo) {
	      return memberService.forgetMemberPassword(vo);
	   }

	   
	   // 강정호 회원 수정 메서드
	   @RequestMapping(value="afterLogin_mypage/updateMember.do", method=RequestMethod.POST)
	   public String updateMember(MemberVO vo, HttpServletRequest request){
	      memberService.updateMember(vo);
	      request.getSession(false).setAttribute("memberVO", vo);
	      return "redirect:home.do";
	   }
	   //황윤상 id체크
	   @RequestMapping("idcheckAjax.do")
	   @ResponseBody
	   public String idcheckAjax(String id) {      
	      int count=memberService.idcheck(id);
	      return (count==0) ? "ok":"fail";       
	   }

	   //황윤상 registerMember
	   @RequestMapping(value="registerMember.do", method = RequestMethod.POST)
	   public String register(MemberVO memberVO, String addressDetail, String businessNumber) {         
	      memberService.registerMember(memberVO, addressDetail, businessNumber);   
	      return "redirect:registerResultView.do?id=" + memberVO.getId();
	   }
	   //황윤상 registerResult
	   @RequestMapping("registerResultView.do")
	   public ModelAndView registerResultView(String id) {      
	      MemberVO memberVO = memberService.findMemberById(id);
	      return new ModelAndView("member/register_result.tiles", "memberVO", memberVO);
	   }
	   
	   //김래현 회원탈퇴
	      @RequestMapping("afterLogin_mypage/deleteAccount.do")
	      public String dropMember(HttpServletRequest request){
	         MemberVO vo=(MemberVO) request.getSession(false).getAttribute("mvo");
	         memberService.dropMember(vo.getId());
	         return "home.tiles";
	}
}