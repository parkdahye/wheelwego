package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.SellerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	 @Autowired
	 BCryptPasswordEncoder passwordEncoder;
/*	public MemberVO login(MemberVO vo){
		return memberDAO.login(vo);
	}*/
	
	 @Override
	   public MemberVO login(MemberVO memberVO){
	      MemberVO _memberVO = memberDAO.login(memberVO);
	      MemberVO result = null;
	      
	      if (_memberVO != null)
	      {
	         String rawPassword = memberVO.getPassword(); //입력한 비밀번호
	         String encodedPassword = _memberVO.getPassword(); // 암호화된 비밀번호(DB저장)
	         
	         if(passwordEncoder.matches(rawPassword, encodedPassword ))  //입력비밀번호 == 암호화된 비밀번호
	            result =  _memberVO;
	      }
	      return result;
	   }

	@Override
	   public String findMemberId(MemberVO vo){
	      return memberDAO.findMemberId(vo);
	   }
	@Override
	   public String findMemberPassword(MemberVO vo){
	      return memberDAO.findMemberPassword(vo);
	   }
	@Override
	   public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	   }
	 @Override
	   public int idcheck(String id) {      
	      return memberDAO.idcheck(id);
	   }
	   @Override
	   public MemberVO findMemberById(String id) {
	      return memberDAO.findMemberById(id);
	   }
	   @Override
	   public void registerMember(MemberVO memberVO, String addressDetail, String businessNumber) {
	      memberVO.setAddress(memberVO.getAddress() + " " + addressDetail);
	      memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
	      
	      if (businessNumber == null)
	         memberDAO.registerCustomer(memberVO);
	      else
	         memberDAO.registerSeller(memberVO, new SellerVO(memberVO, businessNumber));
	   }

}