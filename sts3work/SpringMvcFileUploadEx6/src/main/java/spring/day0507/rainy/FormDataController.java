package spring.day0507.rainy;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.day0507.data.ShopDto;

@Controller
@RequestMapping("/shop")
public class FormDataController {

	@GetMapping("/form1")
	public String form1() //서버전송이 아니라 조회만해주면되니까 String
	{
		return "day0507/form1";
	}
	
	//form1을 전송해야하는 아이 만들기
	@PostMapping("/read1") //String+Model=ModelAndView
	public ModelAndView read1(@RequestParam String irum,
			@RequestParam String gender,
			@RequestParam String addr)
	{
		ModelAndView model=new ModelAndView(); //ModelAndView는 class니까 생성해줘야함
		
		//모델에 담기
		model.addObject("irum", irum); //irum을 받아서 "irum"으로 저장해주겠다
		model.addObject("gender", gender);
		model.addObject("addr", addr);
		
		//포워드(.jsp있는곳으로 이동하는것)
		model.setViewName("day0507/result1"); //result1에서 포워드하겠다 //>>이제 result1에가서 출력해주기
		
		return model;
	}
	
	@GetMapping("/form2")
	public String form2()
	{
		return "day0507/form2";
	}
	
	@PostMapping("/read2") //전송은 PostMapping method post로 했으니
	public String read2(@ModelAttribute ShopDto dto) //shopDto로 모델에 저장
	{
		return "day0507/result2";
	}
	
	
	@GetMapping("/form3")
	public String form3()
	{
		return "day0507/form3";
	}
	
	@PostMapping("/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) //변수명은 map String으로 가져와서 String,으로
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("sang", map.get("sang"));
		model.addObject("color", map.get("color"));
		model.addObject("price", map.get("price"));
		model.addObject("image", map.get("image"));
		
		model.setViewName("day0507/result3"); //result2로 포워드하겠다(포워드해줬으니 오류안남)
		
		return model;
	}
}
