package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.CommunityDto;

@Mapper
public interface CommunityMapperInter {
    public int getTotalCount();
    public void insertCommunity(CommunityDto dto);
    public List<CommunityDto> getAllDatas();
    public CommunityDto getData(String com_num);
    public void updateCommunity(CommunityDto dto);
    public void deleteCommunity(String com_num);
}
