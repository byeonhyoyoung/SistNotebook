package spring.db.carmember;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberDaoInter {

	@Autowired
	private SqlSession session;
	
}
