package org.asechs.wheelwego.model;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.TruckVO;

public interface MypageService {
	void registerFoodtruck(TruckVO tvo);

	TruckVO showMyTruckpage(MemberVO mvo);
}
