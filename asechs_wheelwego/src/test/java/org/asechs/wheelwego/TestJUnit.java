package org.asechs.wheelwego;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.BoardDAO;
import org.asechs.wheelwego.model.FoodTruckService;
import org.asechs.wheelwego.model.MemberService;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 *    TDD : 테스트 주도 개발(test-driven development, TDD)은 
 *            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
 *            
 *    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 *    
 *    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
       <!-- spring junit  -->
  <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${org.springframework-version}</version>            
        </dependency>
        <!-- Test : 기존 4.7에서 4.9로 수정 -->
  <dependency>
   <groupId>junit</groupId>
   <artifactId>junit</artifactId>
   <version>4.9</version>
   <scope>test</scope>
  </dependency>  
 */  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class TestJUnit {
	@Resource
	private MemberService service;
	@Resource

	private FoodTruckService foodService;
	@Resource
	private BoardDAO boardDAO;

	public void test(){
/*		String id = "customer01";
		String password = "1234";
		String memberName = "김래발";
		String postCode = "13437";
		String address = "경기도 성남시 분당구";
		String addressDetail = "삼평동";
		String phoneNumber = "01000000000";
		String memberType = "customer";
		String businessNumber = null;

		service.registerMember(new MemberVO(id, password, memberName, postCode, address, addressDetail, phoneNumber, memberType), businessNumber);*/
		//System.out.println(service.getMemberPassword(id, password));
		//service.deleteMember(id);
		
		/*String id = "seller07";
		String password = "1234";
		String memberName = "김래발";
		String postCode = "13437";
		String address = "경기도 성남시 분당구";
		String addressDetail = "삼평동";
		String phoneNumber = "01000000000";
		String memberType = "seller";
		String businessNumber = "0000000000";

		/*service.registerMember(new MemberVO(id, password, memberName, postCode, address, addressDetail, phoneNumber, memberType), businessNumber);
		//System.out.println(service.getMemberPassword(id, password));
		//service.deleteMember(id);

		
		//int result = service.forgetMemberPassword(new MemberVO(id, "1234", memberName, null, null, null, phoneNumber, null));
		


		//service.registerMember(new MemberVO(id, password, memberName, postCode, address, addressDetail, phoneNumber, memberType), businessNumber);
		//System.out.println(service.getMemberPassword(id, password));
		//service.deleteMember(id);
		
		System.out.println(foodService.searchFoodTruckList("끼니"));*/
		
	}
}




















