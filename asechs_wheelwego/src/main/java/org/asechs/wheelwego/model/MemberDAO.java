package org.asechs.wheelwego.model;

import org.asechs.wheelwego.model.vo.MemberVO;

public interface MemberDAO {
	 MemberVO login(MemberVO vo);

	String findMemberId(MemberVO vo);

	String findMemberPassword(MemberVO vo);
}
