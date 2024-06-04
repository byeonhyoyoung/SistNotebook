package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;


@Controller //빈에 등록
public class IpgoController {

	@Autowired //메서드를 자동주입 받겠다
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start()
	{
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list") //진짜 나타날..
	public ModelAndView list() //ModelAndView로 할것
	{
		ModelAndView mview=new ModelAndView(); //선언해주고 리턴해주고
		
		int totalCount=mapper.getTotalCount();
		List<IpgoDto> list=mapper.getAllDatas();
		
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		
		//mview.setViewName("ipgo/ipgolist");  jsp
		mview.setViewName("/ipgo/ipgolist");  //tiles 
		return mview;
	}
	
	@GetMapping("/ipgo/writeform")
	public String form()
	{
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("/ipgo/insert") //무조건 @PostMapping
	public String insert(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/ipgoimage");
		
		String uploadName="";
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else {
			for(MultipartFile f:upload)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=fName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			//마지막컴마제거
			uploadName=uploadName.substring(0, uploadName.length()-1); //하나빠진것이 uploadName이 되어야함
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpgo(dto); //이렇게 해줘야 이미지까지 들어감
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/updateform")
	public String updateform(@RequestParam String num, Model model) //@RequestParam 생략가능
	{
		//num에 대한 dto얻기
		IpgoDto dto=mapper.getData(num);
		model.addAttribute("dto", dto);
		return "/ipgo/updateform";
	}
	
	@PostMapping("/ipgo/update") // "/ipgo/update"주소 중요(insert에서 변경)
	public String update(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/ipgoimage");
		
		String uploadName="";
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName="null"; //null로 바꾸기
		else {
			for(MultipartFile f:upload)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=fName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			//마지막컴마제거
			uploadName=uploadName.substring(0, uploadName.length()-1); //하나빠진것이 uploadName이 되어야함
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.updateIpgo(dto); //이렇게 해줘야 이미지까지 들어감
		return "redirect:list";
	}
	
	@GetMapping("ipgo/delete")
	public String delete(@RequestParam String num)
	{
		mapper.deleteIpgo(num);
		return "redirect:list";
	}
	
	//ipgolist.jsp에서 현직자인터뷰 링크 클릭시 이동
	@GetMapping("/ipgo/interviewlist")
	public String interviewlist()
	{
		return "/ipgo/interviewlist";
	}
}

