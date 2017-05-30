package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> getFreeBoardList();

}
