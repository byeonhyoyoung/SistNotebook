package spring.mvc.today;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	//@RequestMapping(value = "/", method = RequestMethod.GET)
	/*@GetMapping("/") //����Ʈ�� get�̶� ��������
	public String hello1(Model model) //String�� ������
	{
		model.addAttribute("name", "��ȿ��");
		model.addAttribute("addr", "����� ������ ���ﵿ");
		
		return "result1";
	}*/
}