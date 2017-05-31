package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.PagingBean;

public interface BoardDAO {

	List<BoardVO> getFreeBoardList(PagingBean pagingBean);

	List<BoardVO> getBusinessInfoBoardList(PagingBean pagingBean);

	int getFreeBoardTotalContentCount();

	int getBusinessInfoBoardTotalContentCount();

	int getQnATotalContentCount();

	List<BoardVO> getQnABoardList(PagingBean pagingBean);

	BoardVO getFreeBoardDetail(String no);

	void freeboardDelete(String no);

	void updateHits(int hits);

	void updateBoard(BoardVO vo);

	MemberVO getNameById(String id);

	void updateHitsBusiness(int hits);

	BoardVO getBusinessBoardDetail(String no);

	void businessDelete(String no);

	void business_updateBoard(BoardVO vo);

	MemberVO business_getNameById(String id);

}
