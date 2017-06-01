package org.asechs.wheelwego.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.vo.BoardVO;
import org.asechs.wheelwego.model.vo.FileVO;
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
	public void freeboardWrite(BoardVO bvo, HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("memberVO");
		bvo.setId(mvo.getId());
		// 글 정보먼저 insert한다.
		System.out.println("2번 자유게시판 글쓰기 시작");
		String contentNo=boardDAO.freeboardWrite(bvo);
		
		// 강정호. 파일 업로드. 컨트롤러에 넣기에는 너무 길어서 서비스에 넣었습니다.
		// 그 다음 파일 이름을 insert한다
		String uploadPath="C:\\Users\\KOSTA\\git\\wheelwego\\asechs_wheelwego\\src\\main\\webapp\\resources\\img\\";
		List<MultipartFile> fileList=bvo.getFile();
		//ArrayList<String> filePath=new ArrayList<String>();
		ArrayList<String> nameList=new ArrayList<String>();
		for(int i=0; i<fileList.size(); i++){
			if(fileList.isEmpty()==false){
				BoardVO boardVO=new BoardVO();
				FileVO fileVO=new FileVO();
				String fileName=fileList.get(i).getOriginalFilename();
				if(fileName.equals("")==false){
					try{
						fileList.get(i).transferTo(new File(uploadPath+fileName));
						fileVO.setNo(contentNo);
						fileVO.setFilepath(fileName);
						boardVO.setFileVO(fileVO);
						nameList.add(fileName);
						//filePath.add(uploadPath+fileName);
						boardDAO.freeboardWriteFileUpload(boardVO);
						System.out.println("업로드 완료"+nameList);
					}catch(IllegalStateException | IOException e){
						e.printStackTrace();
						}
					}
			}
		
		}
	}
	
	@Override
	public MemberVO business_getNameById(String id) {
		return boardDAO.business_getNameById(id);
	}

}















