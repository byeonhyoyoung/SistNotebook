package spring.di.ex5;

public class Emp {

	SawonInfo si;
	private String empname;
	private String emploc;
	
	public SawonInfo getSi() {
		return si;
	}
	public void setSi(SawonInfo si) {
		this.si = si;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmploc() {
		return emploc;
	}
	public void setEmploc(String emploc) {
		this.emploc = emploc;
	}
	
	public void writeEmp()
	{
		System.out.println("ȸ���: "+empname);
		System.out.println("ȸ����ġ: "+emploc);
		System.out.println("�����: "+si.getSawonname());
		System.out.println("�޿�: "+si.getPay());
		System.out.println("����: "+si.getPosition());
		System.out.println("�μ���: "+si.getBuseo());
	}
	
	
}
