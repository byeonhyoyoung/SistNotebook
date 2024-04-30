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
		System.out.println("회사명: "+empname);
		System.out.println("회사위치: "+emploc);
		System.out.println("사원명: "+si.getSawonname());
		System.out.println("급여: "+si.getPay());
		System.out.println("직급: "+si.getPosition());
		System.out.println("부서명: "+si.getBuseo());
	}
	
	
}
