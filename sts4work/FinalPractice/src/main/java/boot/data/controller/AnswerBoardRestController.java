package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.AnswerMboardDto;
import boot.data.service.AnsMboardService;
import boot.data.service.MemberService;

@RestController
public class AnswerBoardRestController {

	@Autowired
	AnsMboardService service;
	
	@Autowired
	MemberService mservice;
	
	
	//insert
	@PostMapping("/board/ainsert")  //매핑주소 겹치지않게 :)
	public void insert(@ModelAttribute AnswerMboardDto dto, HttpSession session)
	{
		//num 하나 들어있고..content있고 (content.jsp확인)
		
		//글쓴사람 id아니고 로그인한 id
		String myid=(String)session.getAttribute("myid");
		
		//작성자 이름
		String name=mservice.getName(myid);
		
		//dto 넣기
		dto.setMyid(myid);
		dto.setName(name);
		
		//insert
		service.insertAnswer(dto); //content.jsp script
		
	}
	
	//전체출력
	@GetMapping("/board/alist")
	public List<AnswerMboardDto> alist(String num) //모든 데이터 가져오기
	{
		
		return service.getAllAnswer(num);
	}
	
	//수정(수정은 늘2개)
	@PostMapping("/board/aupdate")
	public String update(@ModelAttribute AnswerMboardDto dto)
	{
		service.deleteAnswer(null);
		
		return "board/content";
	}
	
	//삭제
	@GetMapping("/board/adelete")
	public String delete(@RequestParam String idx)
	{
		service.deleteAnswer(idx);
		
		return "board/content";
	}
}
