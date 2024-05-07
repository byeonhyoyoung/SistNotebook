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

	@GetMapping("/board/form") //@RequestMapping("/board") ���ָ� /form���� ����
	public String form1() /*������ִ� �����常�ϸ�Ǵϱ� String*/
	{
		
		return "board/writeform";
	}
	
	@PostMapping("/board/process") //��뷮 PostMapping
	public ModelAndView process(@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender,
			/*required�� true�� �⺻��, �׸��� ��� ������ �ȳ��� �Ϸ��� false*/
			@RequestParam(required = false) String msg, //���� ���°� �����Ҷ� required = false ���̻��� (true�� �⺻���̱⿡ false�� �������)
			/*�Ǵ� defaultValue�� �ָ�ȴ�*/
			@RequestParam(name = "pageNum", defaultValue = "1")int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("date", date);
		model.addObject("gender", gender);
		model.addObject("msg", msg);
		model.addObject("currentPage", currentPage);
		
		//������
		model.setViewName("board/result");
		
		return model;
	}
	
	@GetMapping("/board/result2")
	public String result2(Model model) //�����ؾ��ϴϱ� model�ʿ���
	{
		model.addAttribute("myimg1", "../image/03.png");
		model.addAttribute("title", "���ڷ縦 �� �����ҳ�");
		
		return "board/result2";
	}
	
	//list.jsp�� �����常
	@GetMapping("/board/list")
	public String list()
	{
		return "board/list";
	}
}