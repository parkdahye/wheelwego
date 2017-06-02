package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.asechs.wheelwego.model.BoardService;
import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Resource
	private BoardService boardService;

	// 강정호 작성. 보드리스트(3개의 아이콘 나오는 것)
	@RequestMapping("boardSelectList.do")
	public String showBoardList() {
		return "board/boardSelectList.tiles";
	}

	// 강정호 작성. 자유게시판 리스트 보여주는 메서드
	@RequestMapping("freeboard_list.do")
	public ModelAndView freeBoardList(String pageNo) {
		/*
		 * System.out.println("보드컨트롤러 자유게시판 메핑 통과"); ListVO
		 * freeBoardList=boardService.getFreeBoardList(pageNo);
		 * System.out.println("BoardController에서 자유게시판 목록 받음: "+freeBoardList);
		 * return new ModelAndView("board/freeboard_list.tiles","freeBoardList",
		 * freeBoardList);
		 */
		return new ModelAndView("board/freeboard_list.tiles", "freeBoardList", boardService.getFreeBoardList(pageNo));
	}

	// 강정호 작성. 창업정보 게시판 리스트 보여주는 메서드
	@RequestMapping("business_list.do")
	public ModelAndView businessInfoBoardList(String pageNo) {
		/*
		 * System.out.println("창업컨트롤러 창업게시판 메핑 통과"); List<BoardVO>
		 * businessInfoBoardList=boardService.getBusinessInfoBoardList();
		 */
		return new ModelAndView("board/business_list.tiles", "businessInfoBoardList",
				boardService.getBusinessInfoBoardList(pageNo));
	}

	// 강정호 작성. Q&A 게시판 리스트 보여주는 메서드
	@RequestMapping("qna_list.do")
	public ModelAndView QnABoardList(String pageNo) {
		return new ModelAndView("board/qna_list.tiles", "qnaBoardList", boardService.getQnABoardList(pageNo));
	}

	// 호겸 작성. 자유게시판 상세보기 and 조회수
	@RequestMapping("board/freeboard_detail_content.do")
	public String freeboard_detail_content(String no, Model model) {
		int hits = Integer.parseInt(no);
		// 조회수 올리기
		boardService.updateHits(hits);
		// 글제목, 조회수, 내용 가져오는 메서드
		BoardVO bvo = boardService.getFreeBoardDetail(no);
		// 파일 이름 가져오는 메서드
		List<FileVO> fileNameList=boardService.getFreeBoardFilePath(no);
		// 작성자 이름 갖고오기
		MemberVO name = boardService.getNameById(bvo);
		model.addAttribute("detail_freeboard", bvo);
		model.addAttribute("fileNameList",fileNameList);
		model.addAttribute("name", name);
		return "board/freeboard_detail_content.tiles";
	}

	// 호겸 작성. 게시물 삭제
	@RequestMapping("freeboardDelete.do")
	public String freeboardDelete(String no) {
		boardService.freeboardDelete(no);
		return "redirect:freeboard_list.do";
	}

	// 호겸 작성. 게시물 수정 폼으로 가기
	@RequestMapping("freeboard_update_form.do")
	public String freeboard_update_form(String no, Model model) {
		//호겸이가 한거 보존
		//BoardVO bvo = boardService.getFreeBoardDetail(no);
		//model.addAttribute("detail_freeboard", bvo);
		return "board/freeboard_update_form.tiles";
	}

	// 호겸 작성. 게시물 수정 해버리기
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo) {
		System.out.println(vo.getNo());
		System.out.println(vo);
		boardService.updateBoard(vo);
		return "redirect:board/freeboard_detail_content.do?no=" + vo.getNo();
	}

	// 창업게시판 상세보기
	@RequestMapping("board/business_detail_content.do")
	public String business_detail_content(String no, Model model) {
		int hits = Integer.parseInt(no);
		// 조회수 올리기
		boardService.updateHitsBusiness(hits);
		BoardVO bvo = boardService.getBusinessBoardDetail(no);
		MemberVO name = boardService.business_getNameById(bvo.getId());
		model.addAttribute("detail_freeboard", bvo);
		model.addAttribute("name", name);
		return "board/business_detail_content.tiles";
	}

	// 호겸 작성. 창업 게시물 삭제
	@RequestMapping("businessDelete.do")
	public String businessDelete(String no) {
		boardService.businessDelete(no);
		return "redirect:business_list.do";
	}

	// 호겸 작성. 창업 게시물 수정 폼으로 가기
	@RequestMapping("business_update_form.do")
	public String business_update_form(String no, Model model) {
		BoardVO bvo = boardService.getBusinessBoardDetail(no);
		model.addAttribute("detail_freeboard", bvo);
		return "board/business_update_form.tiles";
	}

	// 강정호 자유게시판 글 등록 메서드
	@RequestMapping("freeboard_write.do")
	public String freeboardWrite(BoardVO bvo, HttpServletRequest request) {
		boardService.freeboardWrite(bvo, request);
		return "redirect:freeboard_list.do";
	}

	// 호겸 작성. 창업게시물 수정 해버리기
	@RequestMapping("business_updateBoard.do")
	public String business_updateBoard(BoardVO vo) {
		boardService.business_updateBoard(vo);
		return "redirect:board/business_detail_content.do?no=" + vo.getNo();
	}
}
