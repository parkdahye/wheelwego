package org.asechs.wheelwego.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public void freeboardWrite(BoardVO bvo, HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("memberVO");
		bvo.setId(mvo.getId());
		boardDAO.freeboardWrite(bvo);
		
		// 강정호. 파일 업로드. 컨트롤러에 넣기에는 너무 길어서 서비스에 넣었습니다.
		String uploadPath="C:\\Users\\KOSTA\\git\\wheelwego\\asechs_wheelwego\\src\\main\\webapp\\resources\\img";
		List<MultipartFile> fileList=bvo.getFile();
		ArrayList<String> filePath=new ArrayList<String>();
		ArrayList<String> nameList=new ArrayList<String>();
		for(int i=0; i<fileList.size(); i++){
			String fileName=fileList.get(i).getOriginalFilename();
			if(fileName.equals("")==false){
				try{
					fileList.get(i).transferTo(new File(uploadPath+fileName));
					nameList.add(fileName);
					filePath.add(uploadPath+fileName);
					System.out.println("업로드 완료"+filePath);
				}catch(IllegalStateException | IOException e){
					e.printStackTrace();
				}
			}
		}
	}

}















