package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.PagingBean;

public interface BoardDAO {

	List<BoardVO> getFreeBoardList(PagingBean pagingBean);

	List<BoardVO> getBusinessInfoBoardList(PagingBean pagingBean);

	int getFreeBoardTotalContentCount();

	int getBusinessInfoBoardTotalContentCount();

	int getQnATotalContentCount();

	List<BoardVO> getQnABoardList(PagingBean pagingBean);

}
