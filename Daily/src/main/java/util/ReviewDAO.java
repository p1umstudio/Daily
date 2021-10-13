package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import vo.ReviewVO;

@Log4j
@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "daily.mapper.ReviewMapper.";

	
	
	//답글 등록 
	public int replyInsert(ReviewVO vo){
		log.info("Qna_step_Update count =>"+sqlSession.update(NS+"stepUpdate",vo));
		return sqlSession.insert(NS+"replyInsert",vo);
	}
	

	// ----------------------------------------------------------
	// CRUD 
	// myreview
	public List<ReviewVO> myreview(ReviewVO vo) {
		return sqlSession.selectList(NS + "myreview",vo);
	}

	// selectList
	public List<ReviewVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}
	
	// selectOne
	public ReviewVO selectOne(ReviewVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	}

	// insert
	public int insert(ReviewVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	}

	// update
	public int update(ReviewVO vo) {
		return sqlSession.update(NS + "update", vo);
	}

	// delete
	public int delete(ReviewVO vo) {
		return sqlSession.delete(NS + "delete", vo);
	}

}// class
