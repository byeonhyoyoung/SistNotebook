package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //먼저 빈에 등록해주기
/* @RequestMapping("/info") */
public class InfoController {
	//(Mapping하려면)pom.xml에서 버전바꿔주기
	@GetMapping("/info/myform") //../root를 의미(test) //Mapping하나당 메서드하나 생성해주기
	public String form() //String은 포워드를 의미, 이름은 아무거나
	{
		//WEB-INF/info/infoform.jsp의미
		return "info/infoform"; //String이니까 return값 필수
	}
	
	@PostMapping("/info/process")
	public String result(@ModelAttribute("dto") InfoDto dto)
	{
		return "info/infowrite";
	}
	
	
	/*
	 * @PostMapping("/myform") public ModelAndView info(@ModelAttribute InfoDto dto)
	 * { ModelAndView model=new ModelAndView(); model.addObject("dto", dto);
	 * model.setViewName("infowrite");
	 * 
	 * return model; }
	 * 
	 * @PostMapping("/info/process") public ModelAndView process(@RequestParam
	 * String name,
	 * 
	 * @RequestParam String color,
	 * 
	 * @RequestParam(required = false) String hobby,
	 * 
	 * @RequestParam String language) { ModelAndView model=new ModelAndView();
	 * 
	 * model.addObject("name", name); model.addObject("color", color);
	 * model.addObject("hobby", hobby); model.addObject("language", language);
	 * 
	 * model.setViewName("info/result");
	 * 
	 * return model; }
	 */
}
