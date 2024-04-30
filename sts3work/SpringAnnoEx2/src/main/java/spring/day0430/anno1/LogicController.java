package spring.day0430.anno1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") //아이디가 logic이 된다.. 생략하면 logicController로
public class LogicController {
	//=DaoController
	
	@Autowired  //자동주입 되는것을 의미함
	DaoInter inter; //변수를 inter라고 하겠다 //DaoInter는 MyDao를 의미함
	public LogicController() {
		// TODO Auto-generated constructor stub
	}
	
	public LogicController(MyDao dao) {
		//MyDao, DaoInter같음(?)
		this.inter=dao;
	}
	
	//insert
	public void insert(String str)
	{
		inter.insertData(str);
	}
	//delete
	public void delete(String num)
	{
		inter.deleteData(num);
	}
}
