package spring.mvc.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShopController {

	@GetMapping("/") //root�� ����
	public String start()
	{
		return "redirect:login/form"; //
	}
	
	@GetMapping("/login/form") //root�� ��������ִ� ���� //�����ּ� 2���̸� ���2���� ������
	public String form()
	{
		return "form";
	}
	
	//�������ֱ�
	//������
	@GetMapping("/login/read") //controller���� /login�� ��� ���󰡾���, read�� form�� action���� ��
	public String process(Model model, @RequestParam(value = "myid") String id,
			@RequestParam(value = "mypass") String pass) //model���ֱ�~ �����Ѱ��� result���� ����������.
			//()�����ϰ������ id�� myid�� pass�� mypass�� �������
	{
		model.addAttribute("id", id);
	
		//��й�ȣ�� 1234�� �α��μ���, �ƴϸ� ����
		String msg="";
		if(pass.equals("1234"))
			msg="�α��� ����!!";
		else
			msg="�α��� ����!!";
		
		model.addAttribute("msg", msg);
		
		return "result";
	}
}
