package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.WishlistVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<WishlistVO> myWishList(String id) {
		//System.out.println("강정호 MyPageDAOImpl test"+sqlSessionTemplate.selectList("foodtruck.myWishList", wvo));
		System.out.println("MyDAO 통과");
		return sqlSessionTemplate.selectList("foodtruck.myWishList", id);
	}
	@Override
	public void deleteWishList(WishlistVO wishlistVO) {
		sqlSessionTemplate.delete("foodtruck.deleteWishList", wishlistVO);
	}
}
