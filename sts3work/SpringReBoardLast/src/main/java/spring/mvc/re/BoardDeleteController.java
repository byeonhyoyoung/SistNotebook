package spring.mvc.re;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.data.BoardDaoInter;

@Controller
public class BoardDeleteController {

	@Autowired
	BoardDaoInter dao;
	
	@GetMapping("/board/deletepassform")
	//content.jsp button 수정에 있는..
	public ModelAndView upassform(@RequestParam String num,
			@RequestParam String currentPage)
	{
		ModelAndView mview=new ModelAndView();
		mview.addObject("num", num);
		mview.addObject("currentPage", currentPage);
		
		mview.setViewName("board/deletepassform");
		return mview;
	}
	
	@PostMapping("/board/delete")
	public String delete(@RequestParam int num,
			@RequestParam String currentPage,
			@RequestParam int pass,
			HttpSession session)
	{
		int check=dao.getCheckPass(num, pass);
		
		if(check==0) {
			return "board/passfail";
		}else {
			
			String photo=dao.getOneData(num).getPhoto();
			
			if(!photo.equals("no")) { //no가 아닐경우에만 지워주는데
			
				String [] fName=photo.split(",");
				
				//실제업로드경로
				String path=session.getServletContext().getRealPath("/WEB-INF/photo");
				
				for(String f:fName)
				{
					File file=new File(path+"\\"+f);
					file.delete();
				}
			}
			
			dao.deleteBoard(num); //db삭제
			
			
			return "redirect:list?currentPage="+currentPage;
			
		}
		
		
	}
	
	
}
