package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MarketDto;

//Mapper가 Dao임(Dao+DaoInter)
@Mapper //@Mapper로 빈에 따로 등록해야함
public interface MarketMapperInter {

	//데이터베이스에서 전체마켓 데이터의수를 가져오는 메서드
	//반환타입은 int로 전체레코드의 갯수를 나타냄
	public int getTotalCount();
	
	//새로운 마켓데이터를 데이터베이스에 삽입하는 메서드
	//MarketDto객체를 파라미터로 받아서, 이 객체에 담긴 데이터를 데이터베이스에 저장
	//반환타입은 void로, 삽입 작업만 수행하고 반환값은 없다
	public void insertMarket(MarketDto dto);
	
	//데이터베이스에 저장된 모든마켓 데이터를 가져오는 메서드
	//반환타입은 List<MarketDto>로, 여러개의 MarketDto객체를 포함하는 리스트를 반환
	public List<MarketDto> getAllDatas();
	
	//특정마켓 데이터를 가져오는 메서드
	//String타입의 num파라미터를 받아서 해당번호에 해당하는 데이터를반환
	//반환타입은 MarketDto로, 특정마켓 데이터를 나타내는 객체를반환
	public MarketDto getData(String num);
	
	//기존마켓 데이터를 업데이트하는 메서드
	//MarketDto객체를 파라미터로 받아서, 이 객에체 담긴 새로운데이터로 기존데이터를 업데이트
	//반환타입은 void로, 업데이트 작업만 수행하고 반환값은 없다
	public void updateMarket(MarketDto dto);
	
	//String타입의 num파라미터를 받아서 해당번호에 해당하는 데이터를 삭제
	//반환타입은 void로, 삭제작업만 수행하고 반환값은 없다
	public void deleteMarket(String num);
}
