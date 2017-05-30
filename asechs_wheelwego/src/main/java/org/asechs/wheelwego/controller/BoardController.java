package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.BoardService;
import org.asechs.wheelwego.model.vo.BoardVO;
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
		return "board/boardList.tiles";
	}
	
	//강정호 작성. 자유게시판 리스트 보여주는 메서드
	@RequestMapping("freeboard_list.do")
	public ModelAndView freeBoardList(){
		System.out.println("보드컨트롤러 자유게시판 메핑 통과");
		List<BoardVO> freeBoardList=boardService.getFreeBoardList();
		System.out.println("BoardController에서 자유게시판 목록 받음: "+freeBoardList);
		return new ModelAndView("board/freeboard_list.tiles","freeBoardList",freeBoardList);
	}
}




























































