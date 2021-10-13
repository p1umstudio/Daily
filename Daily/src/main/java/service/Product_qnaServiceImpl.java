package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Product_qnaDAO;
import vo.Product_qnaVO;
import vo.QnaVO;

@Service
public class Product_qnaServiceImpl implements Product_qnaService {
	
	@Autowired
	public Product_qnaDAO dao ; 
	
	@Override
	public int replyInsert(Product_qnaVO vo) {
		return dao.replyInsert(vo);
	}
	
// 기본 CRUD =================================================	
	@Override
	public List<Product_qnaVO> selectList() {
		return dao.selectList();
	}
	@Override
	public Product_qnaVO selectOne(Product_qnaVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(Product_qnaVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(Product_qnaVO vo) {
		return dao.update(vo);
	}
	@Override
		public int delete(Product_qnaVO vo) {
			return dao.delete(vo);
		}	
	
}// class
