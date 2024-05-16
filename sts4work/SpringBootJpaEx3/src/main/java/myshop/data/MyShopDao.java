package myshop.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Inter에서 필요한것만..
@Repository
public class MyShopDao {
	//'MyShopDao'데이터베이스에 접근하는 서비스 레이어 역할을 함
	//'MyShopDaoInter'를 이용하여 데이터를 삽입하는 기능을 제공함

	@Autowired
	MyShopDaoInter daoInter;
	
	//insert
	public void insertShop(MyShopDto dto)
	{
		//insert,update모두 save.. id가없어insert, id가있어update
		daoInter.save(dto); //id타입 유무에 따라 자동으로 insert, 또는 update
	}
}
