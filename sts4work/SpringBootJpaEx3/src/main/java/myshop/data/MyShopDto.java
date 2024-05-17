package myshop.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data //getter, setter, toString 메소드 자동생성해줌
//이 클래스가 JPA엔티티임을 나타냄. 즉 데이터베이스 테이블과 매핑됨
@Entity //하나의 테이블이 mysql에 만들어지는것
//이 엔티티가 'myshop'테이블과 매핑됨을 나타냄
@Table(name = "myshop") //자동으로 myshop테이블이 mysql에 만들어진다, 변수가 변경될경우 자동수정됨

//'MyShopDto'는 데이터베이스 테이블과 매핑되는 엔티티 클래스
public class MyShopDto {

	//'num'필드가 이 테이블의 기본키(primary key)임을 나타냄
	@Id //각 엔티티를 구별할수있는 식별자(시퀀스)역할..(insert가 update임)
	//'num'필드의 값이 자동으로 생성됨
	@GeneratedValue(strategy = GenerationType.AUTO) //두줄 시퀀스역할하는 num에 필수로 해줘야함
	private long num;
	
	@Column(name = "sangname")
	private String sangname;
	
	@Column //이름이 같으면 생략가능
	private String sangprice;
	
	@Column
	private String sangcolor;
	
	@Column
	private String sangipgo;
	
	@CreationTimestamp //테이블이 만들어지는 바로 그시간 자동등록(엔티티 생성시점의 시간)
	@Column(updatable = false) //수정시 이컬럼은 수정하지 않겠다는 뜻
	private Timestamp writeday;
	
}
