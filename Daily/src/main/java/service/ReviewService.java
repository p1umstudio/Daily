package service;

import java.util.List;

import vo.ReviewVO;

public interface ReviewService {
	
	
	int replyInsert(ReviewVO vo);
	
	//기본 CRUD
	List<ReviewVO> selectList();
	List<ReviewVO> myreview(ReviewVO vo);
	ReviewVO selectOne(ReviewVO vo);
	int insert (ReviewVO vo);
	int update (ReviewVO vo);
	int delete (ReviewVO vo);
		
}//interface 
