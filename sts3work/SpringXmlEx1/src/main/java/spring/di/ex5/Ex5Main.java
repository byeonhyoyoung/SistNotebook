package spring.di.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("appContext5.xml");
		
		Emp emp=(Emp)app.getBean("emp");
		emp.writeEmp();
	}

}
