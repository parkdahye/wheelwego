package org.asechs.wheelwego.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.asechs.wheelwego.model.FileService;
import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {
	@Resource
	private FileService fileService;
	@Resource
	private MypageService mypageService;

	//파일 업로드 경로 (다운로드시에도 사용)
	private String uploadPath;
	@RequestMapping(method=RequestMethod.POST,value="afterLogin_mypage/showMyfoodtruck.do")
	public ModelAndView fileUpload(TruckVO tvo,  HttpServletRequest request){
		System.out.println("file컨트롤러 시작");
		MemberVO	 mvo=(MemberVO)request.getSession(false).getAttribute("memberVO");
		tvo.setSellerId(mvo.getId());
		mypageService.registerFoodtruck(tvo);
		//실제 운영시에 사용할 서버 업로드 경로
		//uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/"); 
		//개발시에는 워크스페이스 업로드 경로로 준다.
		uploadPath="C:\\java-kosta\\wheelwego-workspace\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		List<MultipartFile> truckList=tvo.getFoodtruckFile(); //푸드트럭이미지 파일 리스트
		List<FoodVO> menuList=tvo.getFoodList(); //메뉴리스트
		//결과 응답화면에 파일명 목록을 전달하기 위한 리스트
		ArrayList<String> turckFileNameList=new ArrayList<String>();
		ArrayList<String> menuFileNameList=new ArrayList<String>();
		for(int i=0; i<truckList.size();i++){
			String fileName=truckList.get(i).getOriginalFilename(); //파일네임을 받아온다.
			if(fileName.equals("")==false){ // 파일이 있다면
				FileVO fileVO=new FileVO(tvo.getFoodtruckNumber(),fileName); //파일객체를 만든다.
				System.out.println("파일 객체"+fileVO);
				try {
					fileService.saveFilePath(fileVO);
					truckList.get(i).transferTo(new File(uploadPath+fileName)); //서버에 전송하여 저장
					turckFileNameList.add(fileName); //리스트에 저장
					System.out.println("업로드 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(menuList);
		for(int i=0; i<menuList.size();i++){
			String fileName=menuList.get(i).getMenuFile().getOriginalFilename();
			if(fileName.equals("")==false){
				try {
					menuList.get(i).getMenuFile().transferTo(new File(uploadPath+fileName));
					menuFileNameList.add(fileName);
					System.out.println("업로드 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("truckFileNameList", turckFileNameList);
		mv.addObject("menuFileNameList", menuFileNameList);
		mv.setViewName("mypage/showMyfoodtruck.tiles");
		return mv;
	}

	@RequestMapping("fileDownload.do")
	public String fileDownload(String fileName){
		System.out.println(fileName+" download!");
		return "downloadView";
	}
}