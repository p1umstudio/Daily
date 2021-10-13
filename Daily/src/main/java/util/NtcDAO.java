package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.NtcVO;

@Repository
public class NtcDAO {
	
	@Autowired
	private	SqlSession sqlSession ;
	
	private static final String NS = "daily.mapper.NtcMapper.";
	
	
	
	public List<NtcVO> selectList(){
		return sqlSession.selectList(NS+"NselectList");
	}
	
	public NtcVO selectOne(NtcVO nvo) {
		return sqlSession.selectOne(NS+"NselectOne",nvo);
	}
	
	// insert 
	public int insert(NtcVO nvo) {
		return sqlSession.insert(NS+"Ninsert",nvo);
	}
	
	// update
	public int update(NtcVO nvo) {
		return sqlSession.update(NS+"Nupdate",nvo);
	}
	// delete 
	public int delete(NtcVO nvo) {
		return sqlSession.delete(NS+"Ndelete",nvo);
	}
	
	
}//class
