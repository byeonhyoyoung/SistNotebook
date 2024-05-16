package boot.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1() //포워드만해줄거라서 String
	{
		return "form/form1"; //form폴더안에 form1.jsp로 가게
	}
	
	@GetMapping("/sist/form2")
	public String form2()
	{
		return "form/form2";
	}
	
	@GetMapping("/sist/form3") //home에서 지정해놓은것
	public String form3()
	{
		return "form/form3";
	}
}
