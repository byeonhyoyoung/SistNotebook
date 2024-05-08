package spring.mysql.hyoyoung;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyShopDao implements MyShopDaoInter {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MyShopDto> getAllList() {
		// TODO Auto-generated method stub
		return session.selectList("getAllMyShop"); //Mapper id
	}
	
}
