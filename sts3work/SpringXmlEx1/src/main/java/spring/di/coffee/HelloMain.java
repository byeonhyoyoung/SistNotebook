package spring.di.coffee;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("�ڹٹ������ Hello�޼��� ȣ���ϱ�");
		
		Hello hello1=new Hello();
		Hello hello2=new Hello(); //new�� ���� ������ ������ �ν��Ͻ�(hello1!=hello2)
		
		System.out.println(hello1.getMessage());
		
		System.out.println(hello1==hello2); //���۷��� �ּ� ��
		//�ڹٿ����� new�� �����Ҷ����� ���ο� ������ �����Ѵ�
		
		
		System.out.println("������ ������� Hello�޼��� ȣ���ϱ�");
		//����xml���� �����´�..���ø����̼� ����ÿ��� �ʿ��ϴ�(console�����Ҷ��� ����xml�ʿ�)
		//������ ����� web.xml�� �̹� �����Ǿ� �����Ƿ� �ʿ����
		
		//���� xml���� ��������
		//������ �����̳ʸ� �ʱ�ȭ�ϰ� ���� ����('helloContext.xml')�� �ε���
		ApplicationContext app1=new ClassPathXmlApplicationContext("helloContext.xml");
		
		//��ü����
		Hello h1=(Hello)app1.getBean("hello"); //���1  //onject�� ��ü����String //hello ��ҹ��� �����Ȯ��
		System.out.println(h1.getMessage());
		
		Hello h2=app1.getBean("hello",Hello.class); //���2
		System.out.println(h2.getMessage());
		
		System.out.println(h1==h2); //�����Ǵ� �ּҰ� ����..������������ �⺻�� �̱����̴�
	}
	
	
	//������ �����ӿ�ũ������ 'ApplicationContext'�� ����Ͽ� ��ü(��)�� �����ϰ� �����Ѵ�.
	//�������� �⺻ ���������� �� ���� �̱���(Singleton)���� �����Ѵ�.
	//��, ������ �� �̸����� ��û�� ������ ���� �ν��Ͻ��� ��ȯ�Ѵ�.
	
	//�ڹ� ���:'new'Ű���带 ����� ������ ���ο� �ν��Ͻ��� ������.
	//������ ���:'ApplicationContext'�� ���� ���� ��û�ϸ�, �⺻������ ���� �̸��� ���� ������ �ν��Ͻ��� ���c��.
	//���� 'h1'�� 'h2'�� ���� �ν��Ͻ��� ������.

}
