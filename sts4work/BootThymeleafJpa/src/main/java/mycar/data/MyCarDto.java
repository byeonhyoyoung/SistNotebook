package mycar.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//Dto 이부분이 가장중요!
//엔티티생성
@Entity
@Table(name = "mycar")
@Data
@AllArgsConstructor //명시적생성자
@NoArgsConstructor
@Builder
public class MyCarDto {

	@Id //식별id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long num;
	
	@Column(name = "carname", length = 30)
	private String carname;
	
	@Column
	private int carprice;
	
	@Column(length = 20)
	private String carcolor;
	
	@Column(length = 100) //기본이255 포토1당 50정도
	private String carphoto;
	
	@Column(updatable = false) //기본으로 주어야함..(업데이트안되는것)
	@CreationTimestamp
	private Timestamp writeday;
	
	@Transient //테이블의 컬럼으로 생성되지 않고 객체에서는 사용가능한 멤버변수
	private int commentcount; //dto에 댓글다는
	
	@Transient //테이블에 생성되면 안되는
	private String message;
	
	
}
