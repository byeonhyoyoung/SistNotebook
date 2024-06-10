package board.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home() //기본 경로를 처리
	{
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list") //클라리언트(사용자)가 브라우저에 직접 접근할 수 있는 공개된 URL 경로
	public ModelAndView list() //list 메소드에서 ModelAndView 객체를 생성
	{
		ModelAndView model=new ModelAndView();
		
		//dao.getAllDatas()메소드를 호출하여 모든 게시글 데이터를 가져오고,
		//이를 list 변수에 저장
		List<BoardDto> list=dao.getAllDatas();
		
		//list 변수의 크기(즉,게시글의 개수)를 list.size()로 구하여 count 라는 이름으로 모델에 추가
		//list 변수 자체도 list 라는 이름으로 모델에 추가
		//따라서 모델 이 모델 속성에 접근하여 ${count}와 ${list}를 사용할수 있게 됨.
		model.addObject("list", list); //게시글 리스트를 모델에 추가
		model.addObject("count", list.size()); //게시글 수를 모델에 추가 
		
		model.setViewName("board/boardlist"); //서버 내부의 로직으로..클라이언트가 직접 접근하는 경로와는 다름
		return model;
	}
	
	@GetMapping("/board/addform")
	public String form()
	{
		return "board/writeform";
	}
	
	@PostMapping("/board/add")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		//실제경로
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty())
			dto.setPhoto("no");
		else {
			dto.setPhoto(uploadName);
			
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//db에 저장
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	
	
}
