package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizController {

	//3개의 매핑주소를 포워드한 주소로 연결되게 만들고 결과물은 해당 포워드된 jsp파일에서 나타나게 한다
	
	@GetMapping("/happy")
	public String happy()
	{
		
		return "nice"; //WEB-INF/data/nice.jsp
	}
	
	@GetMapping("/hello")
	public String hello(Model model)
	{
		model.addAttribute("msg", "2번문제_메세지와 이미지출력");
		
		return "hello";
	}
	
	@GetMapping("/nice/like")
	public String nice(Model model)
	{
		model.addAttribute("name", "변효영");
		model.addAttribute("hp", "010-111-2222");
		model.addAttribute("addr", "서울시 강남구");
		
		return "happy";
	}
	
}
