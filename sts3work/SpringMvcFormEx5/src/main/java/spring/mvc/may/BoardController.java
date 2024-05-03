package spring.mvc.may;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
/* @RequestMapping("/board") */
public class BoardController {

	@GetMapping("/board/form") //@RequestMapping("/board") 써주면 /form으로 가능
	public String form1() /*폼띄어주는 포워드만하면되니까 String*/
	{
		
		return "board/writeform";
	}
	
	@PostMapping("/board/process") //대용량 PostMapping
	public ModelAndView process(@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender,
			/*required는 true가 기본값, 항목이 없어도 에러가 안나게 하려면 false*/
			@RequestParam(required = false) String msg, //폼에 없는값 전송할때 required = false 많이사용됨 (true가 기본값이기에 false로 해줘야함)
			/*또는 defaultValue를 주면된다*/
			@RequestParam(name = "pageNum", defaultValue = "1")int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("date", date);
		model.addObject("gender", gender);
		model.addObject("msg", msg);
		model.addObject("currentPage", currentPage);
		
		//포워드
		model.setViewName("board/result");
		
		return model;
	}
	
	@GetMapping("/board/result2")
	public String result2(Model model) //저장해야하니까 model필요함
	{
		model.addAttribute("myimg1", "../image/03.png");
		model.addAttribute("title", "빗자루를 든 리본소녀");
		
		return "board/result2";
	}
	
	//list.jsp로 포워드만
	@GetMapping("/board/list")
	public String list()
	{
		return "board/list";
	}
}
