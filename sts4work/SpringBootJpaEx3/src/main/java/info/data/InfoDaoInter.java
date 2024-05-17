package info.data;

import org.springframework.data.jpa.repository.JpaRepository;

//id의 타입 Integer
public interface InfoDaoInter extends JpaRepository<InfoDto, Integer> {

	
}
