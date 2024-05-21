package mycar.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import mycar.data.MyCarCommentDto;
import mycar.data.MyCarDto;
import mycar.repository.MyCarCommentDao;

@RestController
@RequiredArgsConstructor //final또는 @NonNull멤버변수만 자동주입
public class MyCarCommentController {

	private final MyCarCommentDao commentDao; //Dao가져오기
	
	@GetMapping("/addcomment")
	public void addComment(@RequestParam Long num,@RequestParam String comment) //mycar comment에 num을..부모의 num가져옴
	{
		//먼저 MyCarDto에 num값을 넣은후 MyCarCommentDto에 넣어준다(외부키로 지정된값)
		
		MyCarDto dto=MyCarDto.builder().num(num).build(); //MyCarDto에 num값 넣어주기
		
		//dto에 값 지정
		MyCarCommentDto commentDto=MyCarCommentDto.builder() // 수정한 부분 시작
				.comment(comment) // 빌더 메서드를 체이닝하여 호출
				.mycar(dto) // dto 객체 설정
				.build(); // 빌더 완성
				
		//db에 insert시키면 끝 (@RestController는 포워드X)
		commentDao.insertCommentMyCar(commentDto);
	}
	
	//부모글에 달린 댓글 반환
	@GetMapping("/commentlist")
	public List<MyCarCommentDto> commentList(@RequestParam Long num)
	{
		return commentDao.getMyCarCommentList(num);
	}
}
