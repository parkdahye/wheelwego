package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	@Resource
	private MypageDAO mypageDAO;
	/**
	 * 트럭정보 등록하기
	 */
	@Override
	public void registerFoodtruck(TruckVO tvo) {
		mypageDAO.registerFoodtruck(tvo);
	}
	@Override
	public TruckVO showMyTruckpage(MemberVO mvo) {
		return mypageDAO.showMyTruckpage(mvo);
	}
}
