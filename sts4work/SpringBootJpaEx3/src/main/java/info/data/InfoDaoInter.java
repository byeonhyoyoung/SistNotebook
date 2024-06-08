package info.data;

import org.springframework.data.jpa.repository.JpaRepository;

//id의 타입 Integer //상속..extends JpaRepository
public interface InfoDaoInter extends JpaRepository<InfoDto, Integer> {

	
}
