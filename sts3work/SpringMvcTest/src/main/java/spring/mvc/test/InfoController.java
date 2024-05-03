package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {

	@GetMapping("/info/myform")
	public String form()
	{
		return "info/infoform";
	}
	
	@PostMapping("/myform")
	public ModelAndView info(@ModelAttribute InfoDto dto)
	{
		ModelAndView model=new ModelAndView();
		model.addObject("dto", dto);
		model.setViewName("infowrite");
		
		return model;
	}
	
	@PostMapping("/info/process")
	public ModelAndView process(@RequestParam String name,
			@RequestParam String color,
			@RequestParam(required = false) String hobby,
			@RequestParam String language)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("color", color);
		model.addObject("hobby", hobby);
		model.addObject("language", language);
		
		model.setViewName("info/result");
		
		return model;
	}
}
