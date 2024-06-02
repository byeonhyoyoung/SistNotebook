package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	//service받기
	@Autowired
	MemberService service;
	
	
	@GetMapping("/member/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		
		mview.addObject("list", list);
		mview.addObject("mcount", list.size());
		
		mview.setViewName("/member/memberlist");
		return mview; //단순 포워드만 시킨것 -> 위에 리스트불러오기
	}
	
	@GetMapping("/member/form")
	public String form()
	{
		return "/member/memberform";
	}
	
	
	//id체크(ajax로)
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheckprocess(@RequestParam String id)
	{
		Map<String, Integer> map=new HashMap<>(); //map으로 받을거니 map선언해주기
		
		//id 체크 메서드 호출
		int n=service.getSerchId(id);
		
		map.put("count", n);  //1  or 0 //http://localhost:9000/member/idcheck?id=hyoyoung 확인해보기
		return map;
	}
	
	//insert
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			MultipartFile myphoto,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/memberphoto");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+myphoto.getOriginalFilename();
		dto.setPhoto(fileName);
		
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
			
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:list";
	}
	
	//회원정보로 가기
	@GetMapping("/member/myinfo")
	public String myinfo(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		model.addAttribute("list", list);
		return "/member/memberinfo";
	}
	
	//회원목록 삭제
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(String num)
	{
		service.deleteMember(num);
	}
	
	@PostMapping("/member/updatephoto")
	//ajax json으로 처리해줘야하니까
	@ResponseBody
	public void photoUpload(String num, MultipartFile photo, HttpSession session) //realpath구해야해서 session도 있어야함
	{
		String path=session.getServletContext().getRealPath("/memberphoto");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+photo.getOriginalFilename();
		
		try {
			photo.transferTo(new File(path+"\\"+fileName)); //포토 업로드
			//return할곳없고 이제 끝
			service.updatePhoto(num, fileName); //이렇게 되면 db사진 수정완료됨..이제 memberinfo.jsp로 가보자(btnnewphoto추가)
			//->db가 업데이트되는것
			
			//세션의 사진변경
			session.setAttribute("loginphoto", fileName); //fileName로다가 photo를 변경해주는것
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//ajax자체가 비동기방식?
	
	//수정폼에 출력할 데이타 반환
	//num에 대한 dto값 반환
	@GetMapping("/member/updateform")
	@ResponseBody
	public MemberDto getData(String num)
	{
		return service.getDataByNum(num);
	}
	
	//수정 (insert랑 똑같이 @PostMapping)
	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto)
	{
		service.updateMember(dto);   //map은 어떤키값을 저장해서 결과값을 도출하고싶을때 사용
	}
	
	//탈퇴
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void deleteme(String num, HttpSession session) //삭제할때는 session도 삭제해야함
	{
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}
	
}