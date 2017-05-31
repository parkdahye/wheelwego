package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
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
		
	public void updateBoard(BoardVO vo) {
		template.update("board.updateBoard",vo);
	}

	@Override
	public MemberVO getNameById(String id) {
		return template.selectOne("board.getNameById", id);
	}

	@Override
	public void updateHitsBusiness(int hits) {
		template.update("board.updateHitsBusiness", hits);
	}

	@Override
	public BoardVO getBusinessBoardDetail(String no) {
		return template.selectOne("board.getBusinessBoardDetail", no);
	}

	@Override
	public void businessDelete(String no) {
		template.delete("board.businessDelete", no);
	}

	@Override
	public void business_updateBoard(BoardVO vo) {
		template.update("board.business_updateBoard", vo);
	}

	@Override
	public MemberVO business_getNameById(String id) {
		return template.selectOne("board.business_getNameById", id);
	}

}
