package service;

import java.util.List;

import vo.Product_qnaVO;

public interface Product_qnaService {
	
	
	int replyInsert(Product_qnaVO vo);
	
	//기본 CRUD
	List<Product_qnaVO> selectList();
	Product_qnaVO selectOne(Product_qnaVO vo);
	int insert (Product_qnaVO vo);
	int update (Product_qnaVO vo);
	int delete (Product_qnaVO vo);
		
}//interface 
