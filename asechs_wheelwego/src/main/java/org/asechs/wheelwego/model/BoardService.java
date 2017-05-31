package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;

public interface BoardService {

	ListVO getFreeBoardList(String pageNo);

	ListVO getBusinessInfoBoardList(String pageNo);

	ListVO getQnABoardList(String pageNo);

	BoardVO getFreeBoardDetail(String no);

	void freeboardDelete(String no);

	void updateHits(int hits);

	void updateHitsBusiness(int hits);

	BoardVO getBusinessBoardDetail(String no);

	void businessDelete(String no);

}
