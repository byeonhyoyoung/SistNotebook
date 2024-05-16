package myshop.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Inter에서 필요한것만..
@Repository
public class MyShopDao {

	@Autowired
	MyShopDaoInter daoInter;
	
	//insert
	public void insertShop(MyShopDto dto)
	{
		//insert,update모두 save.. id가없어insert, id가있어update
		daoInter.save(dto); //id타입 유무에 따라 자동으로 insert, 또는 update
	}
}
