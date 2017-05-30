package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.TruckVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<TruckVO> truckList(String id,String foodtruckNumber) {
		return sqlSessionTemplate.selectList("truck.getTruckList",id);
	}
}
