package spring.mvc.today;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	//@RequestMapping(value = "/", method = RequestMethod.GET)
	/*@GetMapping("/") //디폴트가 get이라 생략가능
	public String hello1(Model model) //String은 포워드
	{
		model.addAttribute("name", "변효영");
		model.addAttribute("addr", "서울시 강남구 역삼동");
		
		return "result1";
	}*/
}
