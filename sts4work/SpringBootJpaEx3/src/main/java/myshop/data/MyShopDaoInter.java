package myshop.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyShopDaoInter extends JpaRepository<MyShopDto, Long>{ //JpaRepository라는 상속을 받음

	//'MyShopDaoInter' 인터페이스는 Spring Data JPA에서 제공하는 'JpaRepository'를 확장하여
	//기본적인 CRUD 기능을 제공함(기본적인 데이터베이스 접근 메소드를 제공함)
	
	//JpaRepository<MyShopDto, Long> : 'MyShopDto'엔티티와 기본 키 타입 'Long'을 사용하여
	//CRUD 메소드를 제공한다.
}
