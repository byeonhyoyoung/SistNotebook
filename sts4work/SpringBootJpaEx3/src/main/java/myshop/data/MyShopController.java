package myshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyShopController {

	@Autowired //insert 하나 만든거 @Autowired
	MyShopDao dao;
	
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:shop/list";
	}
	
	//@GetMapping({"/","/list"})
	@GetMapping("/shop/list")
	public ModelAndView list() //메소드명 입력
	{
		ModelAndView mview=new ModelAndView();
		
		List<MyShopDto> list=dao.getAllSangpums();
		
		mview.addObject("list", list); //list를 list라는 이름으로 저장하겠다
		mview.addObject("totalcount", list.size()); //totalcount로 저장
		
		mview.setViewName("myshop/shoplist");
		return mview;
	}
	
	//입력폼
	@GetMapping("/shop/writeform")
	public String addform()
	{
		return "myshop/addform";
	}
	
	//insert
	@PostMapping("/shop/insert")
	public String add(@ModelAttribute MyShopDto dto)
	{
		
		dao.insertShop(dto);
		return "redirect:list";
	}
	
	//수정폼 띄우기
	@GetMapping("/shop/updateform")
	public ModelAndView uform(Long num)
	{
		ModelAndView model=new ModelAndView();
		
		MyShopDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		model.setViewName("myshop/updateform");
		
		return model;
	}
	
	//실제 수정
	@PostMapping("/shop/update")
	public String update(@ModelAttribute MyShopDto dto)
	{
		dao.updateShop(dto);
		return "redirect:list";
	}
	
	//삭제
	@GetMapping("/shop/delete")
	public String shopDelete(Long num)
	{
		dao.deleteShop(num);
		return "redirect:list";
	}
	
	
}
