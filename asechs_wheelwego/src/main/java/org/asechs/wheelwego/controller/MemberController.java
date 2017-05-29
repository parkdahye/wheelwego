package org.asechs.wheelwego.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.MemberService;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

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
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return "main_home.tiles";
	}
	//id찾기
	@RequestMapping(value="findMemberId.do",method = RequestMethod.POST)
	   public ModelAndView findMemberId(MemberVO vo) {
	      String id = memberService.findMemberId(vo);
	      return new ModelAndView("member/find_result.tiles", "result", id);
	   }
	//pw찾기
	   @RequestMapping(value="findMemberPassword.do",method=RequestMethod.POST)
	   public ModelAndView findMemberPassword(MemberVO vo) {
	      String password = memberService.findMemberPassword(vo);
	      return new ModelAndView("member/find_result.tiles", "result", password);
	   }

}