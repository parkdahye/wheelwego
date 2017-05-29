package org.asechs.wheelwego.model;

import org.asechs.wheelwego.model.vo.MemberVO;

public interface MemberService {
	MemberVO login(MemberVO vo);

	String forgetMemberId(MemberVO vo);

	String forgetMemberPassword(MemberVO vo);

	void updateMember(MemberVO vo);

	int idcheck(String id);

	void registerMember(MemberVO memberVO, String addressDetail, String businessNumber);

	MemberVO findMemberById(String id);

	void dropMember(String id);
}
