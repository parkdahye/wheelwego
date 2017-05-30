package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.BoardVO;

public interface BoardService {

	List<BoardVO> getFreeBoardList();

	BoardVO getFreeBoardDetail(String no);

	void freeboardDelete(String no);

}
