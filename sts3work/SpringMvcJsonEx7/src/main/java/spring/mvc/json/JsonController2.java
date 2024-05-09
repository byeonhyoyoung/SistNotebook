package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.data.PhotoDto;

@RestController
public class JsonController2 {

	@GetMapping("/foodlist3") //@GetMapping�ϳ����������
	public Map<String, Object> list3(@RequestParam String foodname) //Ű����ϱ� Map
	{
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("������ġ", "1.jpg"));
		list.add(new PhotoDto("�߲�ġ", "2.jpg"));
		list.add(new PhotoDto("��������", "9.jpg"));
		list.add(new PhotoDto("�������", "11.jpg"));
		list.add(new PhotoDto("���κζ��", "12.jpg"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("foodname", "���¸޴�");
		map.put("photo", "6.jpg");
		
		for(PhotoDto dto:list)
		{
			if(foodname.equals(dto.getFoodname()))
			{
				map.put("foodname", dto.getFoodname());
				map.put("photo", dto.getPhoto());
				
			}
		}
		
		return map; //������ Map���� �Ѱ��ֱ�
	}
}
