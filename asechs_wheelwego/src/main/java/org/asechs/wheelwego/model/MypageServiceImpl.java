package org.asechs.wheelwego.model;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MypageServiceImpl implements MypageService {
	@Resource
	private MypageDAO mypageDAO;
	private String uploadPath="C:\\Users\\Administrator\\Documents\\카카오톡 받은 파일\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
	/**
	 * 트럭정보 등록하기
	 *  이후 파일 경로도 저장한다.
	 */
	@Override
	public void registerFoodtruck(TruckVO tvo) {
		//uploadPath="C:\\java-kosta\\final_project\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		//uploadPath="C:\\Users\\Administrator\\Documents\\카카오톡 받은 파일\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		List<MultipartFile> truckfileList=tvo.getFoodtruckFile(); 
		for(int i=0; i<truckfileList.size();i++){
			String fileName=truckfileList.get(i).getOriginalFilename();
			if(fileName.equals("")==false){ // 파일이 있다면
				FileVO fileVO=new FileVO(tvo.getFoodtruckNumber(),fileName); //파일객체를 만든다.
				System.out.println("파일 객체"+fileVO);
				try {
					mypageDAO.registerFoodtruck(tvo);  //트럭정보 등록
					mypageDAO.saveFilePath(fileVO); //파일경로 등록
					truckfileList.get(i).transferTo(new File(uploadPath+fileName)); //서버에 전송하여 저장
					System.out.println("업로드 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public TruckVO findtruckInfoByTruckNumber(String truckNumber) {
		return mypageDAO.findtruckInfoByTruckNumber(truckNumber);
	}
	@Override
	public void updateMyfoodtruck(TruckVO truckVO) {
		//uploadPath="C:\\Users\\Administrator\\Documents\\카카오톡 받은 파일\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		List<MultipartFile> truckfileList=truckVO.getFoodtruckFile(); 
		for(int i=0; i<truckfileList.size();i++){
			String fileName=truckfileList.get(i).getOriginalFilename();
			if(fileName.equals("")==false){ // 파일이 있다면
				FileVO fileVO=new FileVO(truckVO.getFoodtruckNumber(),fileName); //파일객체를 만든다.
				System.out.println("파일 객체"+fileVO);
				try {
					mypageDAO.updateMyfoodtruck(truckVO);  //트럭정보 등록
					mypageDAO.updateFilePath(fileVO); //파일경로 등록
					truckfileList.get(i).transferTo(new File(uploadPath+fileName)); //서버에 전송하여 저장
					System.out.println("업로드 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	@Override
	public String findtruckNumberBySellerId(String sellerId) {
		return mypageDAO.findtruckNumberBySellerId(sellerId);
	}
	@Override
	public List<FoodVO> showMenuList(String truckNumber) {
		return mypageDAO.showMenuList(truckNumber);
	}
	//메뉴수정

	//메뉴 삭제
	
	//메뉴 등록
	@Override
	public void registerMenuList(List<FoodVO> foodList, String truckNumber) {
		for(int i=0;i<foodList.size();i++){
			try{
			foodList.get(i).setFoodTruckNumber(truckNumber); //트럭넘버를 세팅
			String fileName=foodList.get(i).getMenuFile().getOriginalFilename();
			foodList.get(i).setFileVO(new FileVO(truckNumber, fileName));
			mypageDAO.registerMenu(foodList.get(i)); //메뉴를 등록한다.
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
