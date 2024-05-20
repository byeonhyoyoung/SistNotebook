package spring.di.coffee;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("자바방식으로 Hello메서드 호출하기");
		
		Hello hello1=new Hello();
		Hello hello2=new Hello(); //new로 새로 생성된 별도의 인스턴스(hello1!=hello2)
		
		System.out.println(hello1.getMessage());
		
		System.out.println(hello1==hello2); //레퍼런스 주소 비교
		//자바에서는 new로 생성할때마다 새로운 영역에 생성한다
		
		
		System.out.println("스프링 방식으로 Hello메서드 호출하기");
		//설정xml파일 가져온다..어플리케이션 실행시에만 필요하다(console실행할때만 설정xml필요)
		//웹으로 실행시 web.xml에 이미 설정되어 있으므로 필요없다
		
		//설정 xml파일 가져오기
		//스프링 컨테이너를 초기화하고 설정 파일('helloContext.xml')을 로드함
		ApplicationContext app1=new ClassPathXmlApplicationContext("helloContext.xml");
		
		//객체생성
		Hello h1=(Hello)app1.getBean("hello"); //방법1  //onject는 객체생성String //hello 대소문자 제대로확인
		System.out.println(h1.getMessage());
		
		Hello h2=app1.getBean("hello",Hello.class); //방법2
		System.out.println(h2.getMessage());
		
		System.out.println(h1==h2); //생성되는 주소가 같다..스프링에서는 기본이 싱글턴이다
	}
	
	
	//스프링 프레임워크에서는 'ApplicationContext'를 사용하여 객체(빈)를 생성하고 관리한다.
	//스프링의 기본 설정에서는 각 빈을 싱글턴(Singleton)으로 관리한다.
	//즉, 동일한 빈 이름으로 요청할 때마다 같은 인스턴스를 반환한다.
	
	//자바 방식:'new'키워드를 사용할 때마다 새로운 인스턴스가 생성됨.
	//스프링 방식:'ApplicationContext'를 통해 빈을 요청하면, 기본적으로 같은 이름의 빈은 동일한 인스턴스를 반홤함.
	//따라서 'h1'과 'h2'는 같은 인스턴스를 참조함.

}
