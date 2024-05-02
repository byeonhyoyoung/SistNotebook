package spring.mvc.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShopController {

	@GetMapping("/") //root로 시작
	public String start()
	{
		return "redirect:login/form"; //
	}
	
	@GetMapping("/login/form") //root를 연결시켜주는 개념 //매핑주소 2개이면 계속2개로 가야함
	public String form()
	{
		return "form";
	}
	
	//연결해주기
	//폼전송
	@GetMapping("/login/read") //controller에서 /login은 계속 따라가야함, read는 form의 action에서 옴
	public String process(Model model, @RequestParam(value = "myid") String id,
			@RequestParam(value = "mypass") String pass) //model해주기~ 저장한값을 result에서 가져오겠죠.
			//()생략하고싶으면 id는 myid로 pass는 mypass로 해줘야함
	{
		model.addAttribute("id", id);
	
		//비밀번호가 1234면 로그인성공, 아니면 실패
		String msg="";
		if(pass.equals("1234"))
			msg="로그인 성공!!";
		else
			msg="로그인 실패!!";
		
		model.addAttribute("msg", msg);
		
		return "result";
	}
}
