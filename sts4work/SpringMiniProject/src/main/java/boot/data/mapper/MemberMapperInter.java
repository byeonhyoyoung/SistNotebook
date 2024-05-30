package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSerchId(String id);
	public String getName(String id);
	public int loginIdPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id); //3줄 로그인에 관한것
	public void deleteMember(String num); //->Sql->ServiceInter에복붙->Service
	
	public MemberDto getDataByNum(String num); //나머지 member값 수정시 필요
	public void updatePhoto(Map<String, String> map); //photo만 업데이트 //dto아니면 map으로(num과photo만 넘기기?)
	public void updateMember(MemberDto dto); //num번호에 대한 데이터 가져와서 수정하는것
}