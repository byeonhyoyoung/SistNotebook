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

@Data
@Entity //하나의 테이블이 mysql에 만들어지는것
@Table(name = "myshop") //자동으로 myshop테이블이 mysql에 만들어진다, 변수가 변경될경우 자동수정됨
public class MyShopDto {

	@Id //각 엔티티를 구별할수있는 식별자(시퀀스)역할..(insert가 update임)
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
	private Timestamp writeday;
	
}
