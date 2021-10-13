package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession ;
	
	private static final String NS = "daily.mapper.MemberMapper.";
	
	
	
	// mchangeaddress
	public int mchangeinfo(MemberVO vo) {
		return sqlSession.update(NS+"mchangeinfo",vo);
	}
	
	// changepw
	public int mchangepw(MemberVO vo) {
		return sqlSession.update(NS+"mchangepw",vo);
	}
	
	// findpw
	public MemberVO mfindid(MemberVO vo) {
		return sqlSession.selectOne(NS+"mfindid",vo);
	}
	
	// findpw
	public MemberVO mfindpw(MemberVO vo) {
		return sqlSession.selectOne(NS+"mfindpw",vo);
	}
	
	// selectList 
	public List<MemberVO> mselectList(){
		return sqlSession.selectList(NS+"mselectList");
	}
	// selectOne
	public MemberVO mselectOne(MemberVO vo) {
		return sqlSession.selectOne(NS+"mselectOne",vo);
	}
	
	// insert 
	public int minsert(MemberVO vo) {
		return sqlSession.insert(NS+"minsert",vo);
	}
	
	// update
	public int mupdate(MemberVO vo) {
		return sqlSession.update(NS+"mupdate",vo);
	}
	// delete 
	public int mdelete(MemberVO vo) {
		return sqlSession.delete(NS+"mdelete",vo);
	}
}//class 
