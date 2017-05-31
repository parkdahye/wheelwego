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

	@Override
	public void updateHitsBusiness(int hits) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO getBusinessBoardDetail(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void businessDelete(String no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public MemberVO getNameById(String id) {
		return boardDAO.getNameById(id);
	}

}
