package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import vo.QnaVO;

@Log4j
@Repository
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "daily.mapper.QnaMapper.";

	
	
	//답글 등록 
	public int replyInsert(QnaVO vo){
		log.info("Qna_step_Update count =>"+sqlSession.update(NS+"stepUpdate",vo));
		return sqlSession.insert(NS+"replyInsert",vo);
	}
	

	// ----------------------------------------------------------
	// CRUD 

	// selectList
	public List<QnaVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}

	// selectOne
	public QnaVO selectOne(QnaVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	}

	// insert
	public int insert(QnaVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	}

	// update
	public int update(QnaVO vo) {
		return sqlSession.update(NS + "update", vo);
	}

	// delete
	public int delete(QnaVO vo) {
		return sqlSession.delete(NS + "delete", vo);
	}

}// class
