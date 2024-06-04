package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReBoardDto;

@Mapper
public interface ReBoardMapperInter {

	public int getTotalCount(Map<String, String> map);
	public void insertReBoard(ReBoardDto dto); //이 2줄이 중요!!
	public List<ReBoardDto> getPagingList(Map<String, Object> map); //String,int모두가능(Object)
	public ReBoardDto getData(int num);
	public void updateRestep(Map<String, Integer> map); //updateRestep중요!!
	public void updateReadCount(int num);
	
	//insert시킬때 상세보기로 갈때 필요(답변형에는 꼭 필요 MaxNum에 1을 더해주니까)
	public int getMaxNum();
	public void deleteBoard(int num); //논외..나머지는 꼭필요
	public void likesUpdate(int num);
	public void updateBoard(ReBoardDto dto);
}
