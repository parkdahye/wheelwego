package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;
import org.springframework.stereotype.Service;

@Service
public class FoodTruckServiceImpl implements FoodTruckService {
	@Resource
	private FoodTruckDAO foodTruckDAO;

	@Override
	public List<TruckVO> foodtruckList() {
		List<TruckVO> truckList=foodTruckDAO.foodtruckList();
		for(int i=0; i<truckList.size();i++){
			String foodtruckNumber=truckList.get(i).getFoodtruckNumber();
			truckList.get(i).setAvgGrade(foodTruckDAO.findAvgGradeByTruckNumber(foodtruckNumber));
			truckList.get(i).setWishlistCount(foodTruckDAO.findWishlistCountByTruckNumber(foodtruckNumber));
		}
		return truckList;
	}
	/* 검색 결과 푸드트럭 리스트 */
	@Override
	public List<TruckVO> searchFoodTruckList(String name){
		return foodTruckDAO.searchFoodTruckList(name);
	}
	
	@Override
	public List<TruckVO> searchFoodTruckByGPS(TruckVO gpsInfo) {
		return foodTruckDAO.searchFoodTruckByGPS(gpsInfo);
	}

	/* foodtruck 상세보기 */
	@Override
	public TruckVO foodTruckAndMenuDetail(String foodtruckNo){
		TruckVO tvo = foodTruckDAO.foodtruckDetail(foodtruckNo);
		tvo.setAvgGrade(foodTruckDAO.findAvgGradeByTruckNumber(tvo.getFoodtruckNumber()));
		tvo.setWishlistCount(foodTruckDAO.findWishlistCountByTruckNumber(tvo.getFoodtruckNumber()));
		List<FoodVO> fvo = foodTruckDAO.foodListDetail(foodtruckNo);
		tvo.setFoodList(fvo);
		return tvo;
	}

	@Override
	public void registerReview(ReviewVO reviewVO) {
		foodTruckDAO.registerReview(reviewVO);
	}

	@Override
	public ListVO getReviewListByTruckNumber(String reviewPageNo, String foodtruckNumber) {
		int totalCount =foodTruckDAO.getReivewTotalCount(foodtruckNumber);
		if(reviewPageNo==null)
			reviewPageNo="1";
		PagingBean pagingBean=new PagingBean( Integer.parseInt(reviewPageNo),totalCount,foodtruckNumber);
		ListVO pagingList=new ListVO();
		pagingList.setReviewList(foodTruckDAO.getReviewListByTruckNumber(pagingBean));
		pagingList.setPagingBean(pagingBean);
		return pagingList;
	}
	@Override
	public void registerBookMark(WishlistVO wishlistVO) {
		foodTruckDAO.registerBookMark(wishlistVO);
		
	}
	@Override
	public int getBookMarkCount(WishlistVO wishlistVO) {
		
		return foodTruckDAO.getBookMarkCount(wishlistVO);
	}
	@Override
	public ListVO getFoodTruckListByName(String pageNo, String name) {
		int totalCount=foodTruckDAO.getTruckListTotalContentCountByName(name);
		PagingBean pagingBean=null;
		
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		
		pagingBean.setSearchWord(name);
		
		return new ListVO(pagingBean, foodTruckDAO.getFoodTruckListByName(pagingBean));
	}
	@Override
	public ListVO getFoodTruckListByGPS(String pageNo, TruckVO gpsInfo) {
		int totalCount=foodTruckDAO.getTruckListTotalContentCountByGPS(gpsInfo);
		PagingBean pagingBean=null;
		
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		
		pagingBean.setGpsInfo(gpsInfo);
				
		return new ListVO(pagingBean, foodTruckDAO.getFoodTruckListByGPS(pagingBean));
	}
	public ListVO filtering(String option, String searchWord, String nowPage) {
		// TODO Auto-generated method stub
		return null;
	}


/*	public int getAvgGradeByTruckNumber(String foodtruckNumber) {
		int avgGrade=0;
		if(foodTruckDAO.findTruckNumberInReview(foodtruckNumber)>0)
			avgGrade=foodTruckDAO.findTruckNumberInReview(foodtruckNumber);
		return avgGrade;
	}*/
/*	@Override
	public ListVO filtering(String option, String searchWord, String nowPage) {
		List<TruckVO> truckList=null;
		if(nowPage==null)
			nowPage="1";
		ListVO pagingList=new ListVO();
		int totalCount=foodTruckDAO.getTruckListTotalContentCountByName(searchWord);
		PagingBean pagingbean=new PagingBean(Integer.parseInt(nowPage),totalCount,searchWord);
		if(option.equals("byWishlistCount")){

			truckList=foodTruckDAO.filteringByWishlistCount(pagingbean);
		}else if(option.equals("byAvgGrade")){
			truckList=foodTruckDAO.filteringByAvgGrade(pagingbean);
		}else{
			truckList=foodTruckDAO.filteringByRegisterDate(pagingbean);
		}
		for(int i=0; i<truckList.size();i++){
			truckList.get(i).setAvgGrade(foodTruckDAO.findAvgGradeByTruckNumber(truckList.get(i).getFoodtruckNumber()));
			truckList.get(i).setWishlistCount(foodTruckDAO.findWishlistCountByTruckNumber(truckList.get(i).getFoodtruckNumber()));
		}
		pagingList.setTruckList(truckList);
		pagingList.setPagingBean(pagingbean);
		return pagingList;
	}*/

}
