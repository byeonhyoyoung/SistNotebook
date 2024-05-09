package spring.db.member;

public interface MemberDaoInter {

	public int getIdCheck(String id);
	public void insertMember(MemberDto dto);
}