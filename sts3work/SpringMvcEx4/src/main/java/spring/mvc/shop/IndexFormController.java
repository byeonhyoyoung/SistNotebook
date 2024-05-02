package spring.mvc.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexFormController {

	@GetMapping("/data/myform")
	public String form1()
	{
		return "form1";
	}
	
	//get방식전송
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam("name") String name,
			@RequestParam int age) //name같으니 ("name")생략가능
	{
		ModelAndView model=new ModelAndView();

		//request에 저장
		model.addObject("name", name);
		model.addObject("age", age);
		
		//포워드 (저장해서 어디에서 볼건가요?는 포워드잖아요)
		model.setViewName("getProcess"); //getProcess에서 볼거양 //getProcess로 가서 읽어오자~이동!
		
		return model;
	}
}
