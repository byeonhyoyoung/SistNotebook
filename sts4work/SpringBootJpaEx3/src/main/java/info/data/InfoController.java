package info.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {

	@Autowired
	InfoDao dao;
	
	@GetMapping("/info/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<InfoDto> list=dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("count", list.size()); //갯수도 저장
		
		model.setViewName("info/infolist");
		return model;
	}
	
	//폼
	@GetMapping("/info/addform")
	public String form()
	{
		return "info/addform";
	}
	
	//insert
	@PostMapping("/info/insert")
	public String add(@ModelAttribute InfoDto dto)
	{
		dao.insertInfo(dto);
		return "redirect:list";
	}
}
