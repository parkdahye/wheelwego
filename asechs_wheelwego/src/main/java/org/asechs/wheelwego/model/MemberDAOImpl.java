package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.SellerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	public MemberVO login(MemberVO vo){
		return sqlSessionTemplate.selectOne("member.login",vo);			
	}
	  @Override
	   public String forgetMemberId(MemberVO vo) {
	      return sqlSessionTemplate.selectOne("member.forgetMemberId", vo);
	   }
	   @Override
	   public String forgetMemberPassword(MemberVO vo) {
	      return sqlSessionTemplate.selectOne("member.forgetMemberPassword", vo);
	   }
	   @Override
	   public void updateMember(MemberVO vo) {
		   sqlSessionTemplate.update("member.updateMember",vo);
	   }
	   @Override
	   public int idcheck(String id) {
	      return sqlSessionTemplate.selectOne("member.idcheck",id);   
	   }

	   @Override
	   public MemberVO findMemberById(String id) {
	      return sqlSessionTemplate.selectOne("member.findMemberById", id);
	   }

	   @Override
	   public void registerCustomer(MemberVO memberVO) {
		   sqlSessionTemplate.insert("member.registerMember", memberVO);
		   sqlSessionTemplate.insert("member.registerCustomer", memberVO.getId());
	   }

	   @Override
	   public void registerSeller(MemberVO memberVO, SellerVO sellerVO) {
		   sqlSessionTemplate.insert("member.registerMember", memberVO);
		   sqlSessionTemplate.insert("member.registerSeller", sellerVO);
	   }
	   @Override
	   public void dropMember(String id) {
		   sqlSessionTemplate.delete("member.dropMember",id);
	   }
	   
}
