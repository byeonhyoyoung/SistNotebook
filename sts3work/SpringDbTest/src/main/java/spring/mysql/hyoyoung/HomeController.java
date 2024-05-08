package spring.mysql.hyoyoung;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MyShopDaoInter daoInter;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		List<MyShopDto> list=daoInter.getAllList();
		
		model.addAttribute("list", list); //list 다 넘길게
		model.addAttribute("totalCount", list.size());
		
		return "home"; //이제 home에 가서 .. 그전에 몇개인지 찍어보자
	}
	
}
