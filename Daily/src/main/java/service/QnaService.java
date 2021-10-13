package service;

import java.util.List;

import vo.QnaVO;

public interface QnaService {
	
	
	int replyInsert(QnaVO vo);
	
	//기본 CRUD
	List<QnaVO> selectList();
	QnaVO selectOne(QnaVO vo);
	int insert (QnaVO vo);
	int update (QnaVO vo);
	int delete (QnaVO vo);
		
}//interface 
