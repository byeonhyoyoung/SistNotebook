package spring.di.ex5;

import java.util.ArrayList;

public class SawonInfo {

	private String sawonname;
	private ArrayList<String> buseo;
	private int pay;
	private String position;
	
	public SawonInfo(String sawonname, String position) {
		this.sawonname=sawonname;
		this.position=position;
	}

	public String getSawonname() {
		return sawonname;
	}

	public void setSawonname(String sawonname) {
		this.sawonname = sawonname;
	}

	public ArrayList<String> getBuseo() {
		return buseo;
	}

	public void setBuseo(ArrayList<String> buseo) {
		this.buseo = buseo;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	
}
