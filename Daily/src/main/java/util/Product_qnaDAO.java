package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import vo.Product_qnaVO;

@Log4j
@Repository
public class Product_qnaDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "daily.mapper.Product_qnaMapper.";

	
	
	//답글 등록 
	public int replyInsert(Product_qnaVO vo){
		log.info("Product_qnaVO_step_Update count =>"+sqlSession.update(NS+"stepUpdate",vo));
		return sqlSession.insert(NS+"replyInsert",vo);
	}
	

	// ----------------------------------------------------------
	// CRUD 

	// selectList
	public List<Product_qnaVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}

	// selectOne
	public Product_qnaVO selectOne(Product_qnaVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	}

	// insert
	public int insert(Product_qnaVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	}

	// update
	public int update(Product_qnaVO vo) {
		return sqlSession.update(NS + "update", vo);
	}

	// delete
	public int delete(Product_qnaVO vo) {
		return sqlSession.delete(NS + "delete", vo);
	}

}// class
