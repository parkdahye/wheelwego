package org.asechs.wheelwego.model;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MypageServiceImpl implements MypageService {
	@Resource
	private MypageDAO mypageDAO;
	//private String uploadPath="C:\\Users\\Administrator\\Documents\\카카오톡 받은 파일\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
	private String uploadPath="C:\\Users\\User\\AppData\\Roaming\\SPB_16.6\\git\\wheelwego\\asechs_wheelwego\\src\\main\\webapp\\resources\\upload\\";
	/**
	 *  트럭정보 등록하기
	 *  이후 파일경로도 같이 등록한다
	 *  Transaction 처리
	 */
	@Override
	public void registerFoodtruck(TruckVO tvo) {
		System.out.println("register+++"+tvo);
		//uploadPath="C:\\java-kosta\\final_project\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		//uploadPath="C:\\Users\\Administrator\\Documents\\카카오톡 받은 파일\\asechs_wheelwego2\\src\\main\\webapp\\resources\\upload\\";
		List<MultipartFile> truckfileList=tvo.getFoodtruckFile(); 
		for(int i=0; i<truckfileList.size();i++){
			String fileName=truckfileList.get(i).getOriginalFilename();
			FileVO fileVO=null;
			if(fileName.equals("")==false){ // 파일이 있다면
				fileVO=new FileVO(tvo.getFoodtruckNumber(),fileName); //파일객체를 만든다.
			}else{
				fileVO=new FileVO(tvo.getFoodtruckNumber(),"defaultTruck.jpg");
			}
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

	@Override
	public TruckVO findtruckInfoByTruckNumber(String truckNumber) {
		return mypageDAO.findtruckInfoByTruckNumber(truckNumber);
	}
	/**
	 * 푸드트럭 설정을 업데이트한다.
	 * 푸드트럭 정보 등록과 프로필 사진 변경
	 */
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
			}else{
				mypageDAO.updateMyfoodtruck(truckVO);  //트럭정보 등록
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
			foodList.get(i).getMenuFile().transferTo(new File(uploadPath+fileName));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	//메뉴수정
	@Override
	public void updateMenu(TruckVO truckVO) {
		List<FoodVO> foodList=truckVO.getFoodList();
		for(int i=0;i<foodList.size();i++){
			try{
			String fileName=foodList.get(i).getMenuFile().getOriginalFilename();
			if(fileName.equals("")){
				System.out.println("service쪽 : "+foodList.get(i));
				mypageDAO.updateMenu(foodList.get(i)); //메뉴를 수정
				
			}else{
				foodList.get(i).setFileVO(new FileVO(foodList.get(i).getMenuId(),fileName));
				System.out.println("service쪽 : "+foodList.get(i));
				mypageDAO.updateMenu(foodList.get(i)); //메뉴를 수정
				mypageDAO.updateMenuFilepath(foodList.get(i).getFileVO());
				foodList.get(i).getMenuFile().transferTo(new File(uploadPath+fileName));
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteMyTruck(String foodtruckNumber) {
		mypageDAO.deleteMyTruck(foodtruckNumber);
	}
}
