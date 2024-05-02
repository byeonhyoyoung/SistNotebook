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
	
	//get�������
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam("name") String name,
			@RequestParam int age) //name������ ("name")��������
	{
		ModelAndView model=new ModelAndView();

		//request�� ����
		model.addObject("name", name);
		model.addObject("age", age);
		
		//������ (�����ؼ� ��𿡼� ���ǰ���?�� �������ݾƿ�)
		model.setViewName("getProcess"); //getProcess���� ���ž� //getProcess�� ���� �о����~�̵�!
		
		return model;
	}
}
