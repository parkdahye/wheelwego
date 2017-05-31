package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	public void registerFoodtruck(TruckVO tvo){
		sqlSessionTemplate.insert("mypage.registerFoodtruck", tvo);
	}
	@Override
	public TruckVO showMyTruckpage(MemberVO mvo) {
		return sqlSessionTemplate.selectOne("mypage.showMyTruckpage", mvo.getId());
	}
}
