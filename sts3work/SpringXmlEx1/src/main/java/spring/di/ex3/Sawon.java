package spring.di.ex3;

public class Sawon {

	SawonData data;
	
	public Sawon(SawonData data) {
		this.data=data; //�̸��Ȱ����� this
	}
	
	public void writeData()
	{
		System.out.println("�����: "+data.getSawonname());
		System.out.println("�޿�: "+data.getPay());
		System.out.println("�Ի��� "+data.getIpsaday());
	}
}
