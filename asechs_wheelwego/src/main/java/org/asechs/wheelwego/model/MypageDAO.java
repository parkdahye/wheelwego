package org.asechs.wheelwego.model;

import java.util.List;

import org.asechs.wheelwego.model.vo.WishlistVO;

public interface MypageDAO {
	public List<WishlistVO> myWishList(String id);
	
	public void deleteWishList(WishlistVO wishlistVO);
}
