package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FAQVO;

@Repository
public class FAQDAO {

	
	@Autowired
	private	SqlSession sqlSession ;
	
	private static final String NS = "daily.mapper.FAQMapper.";
	
	
	
	public List<FAQVO> selectList(){
		return sqlSession.selectList(NS+"selectList");
	}
	
	public FAQVO selectOne(FAQVO fvo) {
		return sqlSession.selectOne(NS+"selectOne",fvo);
	}
	
	// insert 
	public int insert(FAQVO fvo) {
		return sqlSession.insert(NS+"insert",fvo);
	}
	
	// update
	public int update(FAQVO fvo) {
		return sqlSession.update(NS+"update",fvo);
	}
	// delete 
	public int delete(FAQVO fvo) {
		return sqlSession.delete(NS+"delete",fvo);
	}
	
}
