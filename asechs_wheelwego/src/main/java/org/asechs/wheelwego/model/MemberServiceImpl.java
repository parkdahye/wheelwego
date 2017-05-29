package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	public MemberVO login(MemberVO vo){
		return memberDAO.login(vo);
	}
	@Override
	   public String findMemberId(MemberVO vo){
	      return memberDAO.findMemberId(vo);
	   }
	@Override
	   public String findMemberPassword(MemberVO vo){
	      return memberDAO.findMemberPassword(vo);
	   }
}