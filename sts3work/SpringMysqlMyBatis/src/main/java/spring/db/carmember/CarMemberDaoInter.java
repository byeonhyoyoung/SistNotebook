package spring.db.carmember;

import java.util.List;

public interface CarMemberDaoInter {
	
	public int getTotalCount();
	public void insertMember(CarMemberDto dto);
	public List<CarMemberDto> getAllDatas();
	public CarMemberDto getOneData(String num); //리턴타입(CarMemberDto) 파라메타타입(String num)
	public void updateCarMember(CarMemberDto dto);
	public void deleteMember(String num);
}