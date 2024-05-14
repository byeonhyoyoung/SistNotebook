package spring.mvc.answercontroller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.answerdata.AnswerDao;

@RestController
public class AnswerRestController {

	@Autowired
	AnswerDao adao;
	
	//ajax�ϱ� @GetMapping
	@GetMapping("/board/adelete") //ajax url�� ���ν�ų��("/board/adelete") 
	public HashMap<String, Integer> answerDelete(@RequestParam int idx,
			@RequestParam String pass)
	{
		
		int check=adao.getCheckPass(idx, pass);
		if(check==1)
		{
			adao.deleteAnswer(idx);
		}
		
		//1�ƴϸ� 0�̴ϱ� Integer (�°��߾���1 Ʋ����0)
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("check", check);
		return map;
		
	}
}
