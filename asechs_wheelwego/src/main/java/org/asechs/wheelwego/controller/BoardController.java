package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.BoardService;
import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Resource
	private BoardService boardService;
	
	// 강정호 작성. 보드리스트(3개의 아이콘 나오는 것)말고 바로 자유게시판으로 갈 수 있게 임시로 해 놓았음
	@RequestMapping("boardSelectList.do")
	public String showBoardList(){
		return "board/boardSelectList.tiles";
	}
	
	//강정호 작성. 자유게시판 리스트 보여주는 메서드
	@RequestMapping("freeboard_list.do")
	public ModelAndView freeBoardList(String pageNo){
		/*System.out.println("보드컨트롤러 자유게시판 메핑 통과");
		ListVO freeBoardList=boardService.getFreeBoardList(pageNo);
		System.out.println("BoardController에서 자유게시판 목록 받음: "+freeBoardList);
		return new ModelAndView("board/freeboard_list.tiles","freeBoardList",freeBoardList);*/
		return new ModelAndView("board/freeboard_list.tiles","freeBoardList",boardService.getFreeBoardList(pageNo));
	}
	
	//강정호 작성. 창업정보 게시판 리스트 보여주는 메서드
	@RequestMapping("business_list.do")
	public ModelAndView businessInfoBoardList(String pageNo){
		/*System.out.println("창업컨트롤러 창업게시판 메핑 통과");
		List<BoardVO> businessInfoBoardList=boardService.getBusinessInfoBoardList();*/
		return new ModelAndView("board/business_list.tiles","businessInfoBoardList",boardService.getBusinessInfoBoardList(pageNo));
	}
	
	//강정호 작성. Q&A 게시판 리스트 보여주는 메서드
	@RequestMapping("qna_list.do")
	public ModelAndView QnABoardList(String pageNo){
		return new ModelAndView("board/qna_list.tiles","qnaBoardList",boardService.getQnABoardList(pageNo));
	}
	
}




























































