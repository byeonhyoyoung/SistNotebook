package spring.day0430.anno1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") //���̵� logic�� �ȴ�.. �����ϸ� logicController��
public class LogicController {
	//=DaoController
	
	@Autowired  //�ڵ����� �Ǵ°��� �ǹ���
	DaoInter inter; //������ inter��� �ϰڴ� //DaoInter�� MyDao�� �ǹ���
	public LogicController() {
		// TODO Auto-generated constructor stub
	}
	
	public LogicController(MyDao dao) {
		//MyDao, DaoInter����(?)
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
