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
	
	@Column(updatable = false) //생성 후 수정되지 않음
	private String writer; //게시글 작성자(작성 후 수정하 수 없음)
	
	@Column
	private String subject;
	
	@Column
	private String content;
	
	@Column
	private String photo;
	
	@CreationTimestamp //글올리는시점 now()
	@Column(updatable = false)
	private Timestamp writeday; //게시글 작성일로, 작성 시점이 자동으로 설정되며 수정할 수 없음
	
}
