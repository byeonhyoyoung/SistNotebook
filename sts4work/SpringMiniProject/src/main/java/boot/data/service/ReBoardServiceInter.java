package boot.data.service;

import java.util.List;

import boot.data.dto.ReBoardDto;

public interface ReBoardServiceInter {

	public int getTotalCount(String searchcolumn,String searchword);
	public void insertReBoard(ReBoardDto dto); //이 2줄이 중요!!
	public List<ReBoardDto> getPagingList(String searchcolumn,String searchword,int startnum,int perpage); //String,int모두가능(Object)
	public ReBoardDto getData(int num);
	public void updateRestep(int regroup,int restep); //updateRestep중요!!
	public void updateReadCount(int num);
	
	//insert시킬때 상세보기로 갈때 필요(답변형에는 꼭 필요 MaxNum에 1을 더해주니까)
	public int getMaxNum();
	public void deleteBoard(int num); //논외..나머지는 꼭필요
	public void likesUpdate(int num);
	public void updateBoard(ReBoardDto dto);
}
