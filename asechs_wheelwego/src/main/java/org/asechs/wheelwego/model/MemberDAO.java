package org.asechs.wheelwego.model;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.SellerVO;

public interface MemberDAO {
	 MemberVO login(MemberVO vo);

	String findMemberId(MemberVO vo);

	String findMemberPassword(MemberVO vo);

	void updateMember(MemberVO vo);

	int idcheck(String id);

	MemberVO findMemberById(String id);

	void registerCustomer(MemberVO memberVO);

	void registerSeller(MemberVO memberVO, SellerVO sellerVO);
}
