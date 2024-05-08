package spring.db.carmember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberDaoInter memberInter;
	
	@GetMapping("/list2")
	public String list2 (Model model)
	{
		return null;
		
	}
}
