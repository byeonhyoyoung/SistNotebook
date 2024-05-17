package board.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "jpaboard")
@Data
public class BoardDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long num;
	
	@Column(updatable = false) //수정안되게
	private String writer;
	
	@Column
	private String subject;
	
	@Column
	private String content;
	
	@Column
	private String photo;
	
	@CreationTimestamp //글올리는시점 now()
	@Column(updatable = false)
	private Timestamp writeday;
	
}
