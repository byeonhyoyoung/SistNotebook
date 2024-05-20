package mycar.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import mycar.data.MyCarDto;

@Repository //이 클래스가 데이터베이스 작업을 수행하는 클래스임을 알려줌
@AllArgsConstructor //Lombok을 사용하여 모든 필드를 매개변수로 갖는 생성자를 자동 생성
public class MyCarDao {

	MyCarDaoInter daoInter;
	
	//db저장
	public void insertMyCar(MyCarDto dto)
	{
		daoInter.save(dto); //메서드를 호출해여 Dto객체를 db에저장
	}
	
	//전체출력
	//데이터베이스에 저장된 모든 'MyCarDto'객체를 리스트 형태로 반환
	public List<MyCarDto> getAllCars() 
	{
		return daoInter.findAll(); //전체출력
		//return daoInter.findAll(Sort.by(Sort.Direction.DESC,"carprice")); 가격비싼것부터 출력
	}
	
	public MyCarDto getData(Long num) //주어진 'num'(ID)을 가진 'MyCarDto'객체를 반환
	{
		return daoInter.getReferenceById(num); //메서드를 호출하여 해당ID를 가진 객체를 조회
	}
	
	public void deleteMyCar(Long num)
	{
		daoInter.deleteById(num);
	}
	
	public void updateMyCar(MyCarDto dto)
	{
		daoInter.save(dto); //num포함이므로 수정
	}
}
