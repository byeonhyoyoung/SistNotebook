package spring.mvc.shop;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
			@RequestParam int age,
			@RequestParam(value = "msg", defaultValue = "좋은하루보내세요~*") String msg) //name같으니 ("name")생략가능
	{
		ModelAndView model=new ModelAndView();

		//request에 저장
		model.addObject("name", name);
		model.addObject("age", age);
		model.addObject("msg", msg);
		
		//포워드 (저장해서 어디에서 볼건가요?는 포워드잖아요)
		model.setViewName("getProcess"); //getProcess에서 볼거양 //getProcess로 가서 읽어오자~이동!
		
		return model;
	}
	
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute ShopDto dto)
	{
		ModelAndView model=new ModelAndView();
		model.addObject("dto", dto);
		model.setViewName("postProcess");
		
		return model;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) 
	{
		ModelAndView model=new ModelAndView();
				
		String sang=map.get("sang"); //sang이라는 네임값으로 가져옴
		String price=map.get("price");
		String color=map.get("color");
		
		String data=sang+"의 가격은 "+price+"이며 색상은 "+color+"입니다";
		
		model.addObject("data", data);
		model.setViewName("mapProcess");
		return model;
	}
}
