package spring.di.ex2;

public class Person {

	String schoolName;
	MyInfo info; //레퍼런스해주기
	
	//명시적생성자
	public Person(MyInfo info) {
		super(); //생략가능, 쓸거면 맨위에쓰기
		this.info=info;
		
	}

	//setter
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	//출력
	public void writeData()
	{
		System.out.println("**학생정보 출력**");
		
		System.out.println("학교명: "+schoolName);
		System.out.println("이름: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
	}
}
