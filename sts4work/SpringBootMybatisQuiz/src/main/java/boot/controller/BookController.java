package boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.data.BookDto;
import boot.data.BookMapperInter;

@Controller
public class BookController {
	
	@Autowired
	BookMapperInter mapper;

	@GetMapping("/")
	public String start()
	{
		return "redirect:book/list";
	}
	
	@GetMapping("/book/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		
		//db로부터 총갯수얻기
		int totalCount=mapper.getTotalCount();
		
		//리스트
		List<BookDto> list=mapper.getAllDatas();
		
		//저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		
		//포워드
		mview.setViewName("book/booklist");
		return mview;
	}
	
	@GetMapping("/book/addform")
	public String form()
	{
		return "book/addform";
	}
	
	
}
