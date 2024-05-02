package spring.mvc.today;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller //까먹기전에 먼저 bean에 등록하기
public class HomeController {

	@GetMapping(value = "/")
	public String home(Model model)
	{
		//request에 저장
		model.addAttribute("msg", "HomeController로부터 포워드됨");
		model.addAttribute("today", new Date());
		
		return "home"; //WEB-INF/day0502/home.jsp를 의미
	}
	
	
	@GetMapping("apple/list") //디스패처서블릿이 헷갈리지않게
	//@GetMapping("apple/list.do")
	//@GetMapping("apple/list.naver")
	public String applelist(Model model) //저장소 Model
	{
		model.addAttribute("stuName", "이진우");
		model.addAttribute("stuLoc", "4강의장");
		
		return "stuResult1";
	}
	
	
	@GetMapping("/banana/insert")
	
	public ModelAndView banana() //저장해주고 보여주기위한
	{
		//ModelAndView는 request에 저장하기 위한 Model과 포워드를 위한 View를 합쳐놓은 클래스
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("java", 88);
		mview.addObject("mysql", 77);
		
		//포워드할 jsp파일 지정해줘야함
		mview.setViewName("scoreResult");
		
		return mview;
	}
	
	@GetMapping("/orange/select")
	public String orange(Model model, HttpSession session) //Model은 request에 저장하는것
	{
		
		//request에 저장
		model.addAttribute("s_msg", "스프링 매핑 연습중!!");
	
		//session에 저장
		session.setAttribute("myid", "admin");
		
		return "orangeResult";
	}
	
	@GetMapping("shop/detail")
	public String reShop() //포워드만 해주면됨 //매핑주소의 메서드명은 아무거나(겹치지않게만)
	{
		return "resResult";
	}
}
