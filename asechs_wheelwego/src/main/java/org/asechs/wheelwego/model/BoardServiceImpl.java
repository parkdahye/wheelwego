package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private BoardDAO boardDAO;
	
	@Override
	public ListVO getFreeBoardList(String pageNo) {
		int totalCount=boardDAO.getFreeBoardTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount,1);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		/*HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());*/
		return new ListVO((List<BoardVO>) boardDAO.getFreeBoardList(pagingBean),pagingBean);
	}

	@Override
	public ListVO getBusinessInfoBoardList(String pageNo) {
		int totalCount=boardDAO.getBusinessInfoBoardTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount,1);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		/*HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());*/
		return new ListVO((List<BoardVO>) boardDAO.getBusinessInfoBoardList(pagingBean),pagingBean);
	}

	@Override
	public ListVO getQnABoardList(String pageNo) {
		int totalCount=boardDAO.getQnATotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount,1);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		/*HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());*/
		return new ListVO((List<BoardVO>) boardDAO.getQnABoardList(pagingBean),pagingBean);
	}
/*-------------------자유게시판--------------------------------------------------*/
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public MemberVO getNameById(String id) {
		return boardDAO.getNameById(id);
	}

	@Override
	public BoardVO getFreeBoardDetail(String no) {
		return boardDAO.getFreeBoardDetail(no);
	}

	@Override
	public void freeboardDelete(String no) {
		boardDAO.freeboardDelete(no);
	}

	@Override
	public void updateHits(int hits) {
		boardDAO.updateHits(hits);
	}
/*-------------------창업게시판-------------------------------------------------*/
	@Override
	public void updateHitsBusiness(int hits) {
		boardDAO.updateHitsBusiness(hits);
	}

	@Override
	public BoardVO getBusinessBoardDetail(String no) {
		return boardDAO.getBusinessBoardDetail(no);
	}

	@Override
	public void businessDelete(String no) {
		boardDAO.businessDelete(no);
	}

	@Override
	public void business_updateBoard(BoardVO vo) {
		boardDAO.business_updateBoard(vo);
		
	}

	@Override
	public MemberVO business_getNameById(String id) {
		return boardDAO.business_getNameById(id);
	}

}
