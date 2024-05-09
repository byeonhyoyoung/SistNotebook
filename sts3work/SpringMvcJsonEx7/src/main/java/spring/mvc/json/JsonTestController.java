package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.data.PhotoDto;

@Controller
public class JsonTestController {

	@GetMapping("/list1") //ajax의 url에 연결(mapping주소값과 연결)
	@ResponseBody //json을 처리하고 바로 브라우저로 출력해줌
	public Map<String, String> list1() //key값은 String으로 고정된 값!!
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "변효영");
		map.put("hp", "010-1234-5678");
		map.put("addr", "서울시 강남구"); //String으로 담기로했으니까
		
		return map;
	}
	

@GetMapping("/foodlist2")
@ResponseBody
public List<PhotoDto> list2()
{
	List<PhotoDto> list=new ArrayList<PhotoDto>();
	
	list.add(new PhotoDto("샌드위치", "1.jpg"));
	list.add(new PhotoDto("닭꼬치", "2.jpg"));
	list.add(new PhotoDto("연근조림", "9.jpg"));
	list.add(new PhotoDto("망고빙수", "11.jpg"));
	list.add(new PhotoDto("순두부라면", "12.jpg"));
	
	return list;
}

}


