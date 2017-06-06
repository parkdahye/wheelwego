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
		return foodTruckDAO.foodtruckList();
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
		PagingBean pagingBean=null;
		if(reviewPageNo==null)
			pagingBean=new PagingBean(Integer.parseInt("1"),totalCount,foodtruckNumber);
		else
			pagingBean=new PagingBean( Integer.parseInt(reviewPageNo),totalCount,foodtruckNumber);
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
	public ListVO getFoodTruckListByName(String pageNo, String name) {
		int totalCount=foodTruckDAO.getTruckListTotalContentCount(name);
		PagingBean pagingBean=null;
		
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		
		pagingBean.setSearchWord(name);
		
		return new ListVO(pagingBean, foodTruckDAO.getFoodTruckListByName(pagingBean));
	}

	public int getAvgGradeByTruckNumber(String foodtruckNumber) {
		int avgGrade=0;
		if(foodTruckDAO.findTruckNumberInReview(foodtruckNumber)>0)
			avgGrade=foodTruckDAO.findTruckNumberInReview(foodtruckNumber);
		return avgGrade;
	}
	@Override
	public ListVO filtering(String option, String searchWord, String nowPage) {
		List<TruckVO> truckList=null;
		if(nowPage==null)
			nowPage="1";
		PagingBean pagingbean=null;
		ListVO pagingList=new ListVO();
		int totalCount=foodTruckDAO.getTruckListTotalContentCount(searchWord);
		if(option.equals("byRegisterDate")){
			 pagingbean=new PagingBean(Integer.parseInt(nowPage),totalCount,searchWord);
			truckList=foodTruckDAO.filteringByWishlistCount(pagingbean);
		}else if(option.equals("byAvgGrade")){
			 pagingbean=new PagingBean(Integer.parseInt(nowPage),totalCount,searchWord);
			truckList=foodTruckDAO.filteringByAvgGrade(pagingbean);
		}else{
			 pagingbean=new PagingBean(Integer.parseInt(nowPage),totalCount,searchWord);
			truckList=foodTruckDAO.filteringByRegisterDate(pagingbean);
		}
		for(int i=0; i<truckList.size();i++)
			truckList.get(i).setAvgGrade(foodTruckDAO.findAvgGradeByTruckNumber(truckList.get(i).getFoodtruckNumber()));
		pagingList.setTruckList(truckList);
		pagingList.setPagingBean(pagingbean);
		return pagingList;
	}
}
