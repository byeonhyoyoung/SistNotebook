package boot.data.service;

import java.util.List;

import boot.data.dto.MemBoardDto;

public interface MemBoardServiceInter {

	public int getTotalCount();
	public void insertMemBoard(MemBoardDto dto);
	public List<MemBoardDto> getList(int start, int perpage); //perpage니까 Integer
	public MemBoardDto getData(String num); //num에 따른 dto필요
	public void updateReadCount(String num);
	public int getMaxNum();
}
