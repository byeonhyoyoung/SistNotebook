package spring.db.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberDaoInter dao;
	
	@GetMapping("/carmember/list")
	public String list(Model model)
	{
		//목록 가져오기
		List<CarMemberDto>list=dao.getAllDatas();
		
		int count=dao.getTotalCount();
		//request 에  목록 저장
		model.addAttribute("list", list);
		model.addAttribute("count", count);

		
		return "carmember/memberlist";
	}
	
	@GetMapping("/carmember/writeform")
	public String form()
	{
		return "carmember/memberform";
	}


	@PostMapping("/carmember/write")
	public String insert(@ModelAttribute CarMemberDto dto)
	{
		dao.insertMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/carmember/updateform") /*넘기는게아니라 나타내는거(GetMapping)*/
	public String uform(@RequestParam String num,Model model) //넘겼으니 받아야지((@RequestParam)
	{
		CarMemberDto dto=dao.getOneData(num);
		model.addAttribute("dto", dto); //저장해
		return "carmember/updateform";
	}
	
	@PostMapping("/carmember/update")
	public String update(@ModelAttribute CarMemberDto dto)
	{
	
		dao.updateCarMember(dto);
		return "redirect:list"; //수정해서 목록으로가야지(이미있잖아)
	}
	
	@GetMapping("/carmember/delete")
	public String delete(@RequestParam String num) //num값 넘겼으니 가져와야지
	{
		dao.deleteMember(num); //num값 넘겨주기
		return "redirect:list";
	}
	
}