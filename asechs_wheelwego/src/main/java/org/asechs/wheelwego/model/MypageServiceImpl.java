package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.WishlistVO;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	@Resource
	private FoodTruckDAO foodtruckDAO;
	@Resource
	private MypageDAO mypageDAO;
	@Override
	public List<WishlistVO> myWishList(String id) {
		System.out.println("서비스 실행");
		return mypageDAO.myWishList(id);
			
	}
	@Override
	public void deleteWishList(WishlistVO wishlistVO) {
		mypageDAO.deleteWishList(wishlistVO);
	}
}
