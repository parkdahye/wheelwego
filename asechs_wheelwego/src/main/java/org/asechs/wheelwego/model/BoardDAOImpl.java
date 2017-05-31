package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource
	SqlSessionTemplate template;
	
	@Override
	public List<BoardVO> getFreeBoardList(PagingBean pagingBean) {
		return template.selectList("board.getFreeBoardList", pagingBean);
	}

	@Override
	public List<BoardVO> getBusinessInfoBoardList(PagingBean pagingBean) {
		return template.selectList("board.getBusinessInfoBoardList", pagingBean);
	}

	@Override
	public int getFreeBoardTotalContentCount() {
		return template.selectOne("board.getFreeBoardTotalContentCount");
	}

	@Override
	public int getBusinessInfoBoardTotalContentCount() {
		return template.selectOne("board.getBusinessInfoBoardTotalContentCount");
	}

	@Override
	public int getQnATotalContentCount() {
		return template.selectOne("board.getQnATotalContentCount");
	}

	@Override
	public List<BoardVO> getQnABoardList(PagingBean pagingBean) {
		return template.selectList("board.getQnABoardList", pagingBean);
	}

	@Override
	public BoardVO getFreeBoardDetail(String no) {
		return template.selectOne("board.getFreeBoardDetail", no);
	}

	@Override
	public void freeboardDelete(String no) {
		template.delete("board.freeboardDelete", no);
	}

	@Override
	public void updateHits(int hits) {
		template.update("board.updateCount", hits);
	}

	@Override
	public void freeboardWrite(BoardVO bvo) {
		template.insert("board.freeboardWrite",bvo);
		
	}

}
