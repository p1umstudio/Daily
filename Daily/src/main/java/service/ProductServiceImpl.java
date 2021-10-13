package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Pageing.Searchpage;
import util.ProductDAO;
import vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	
	@Override
	public int searchRowsCount(Searchpage spage) {
		return dao.searchRowsCount(spage);
	}
	
	@Override
	public List<ProductVO> keywordsearchList(Searchpage spage) {
		return dao.keywordsearchList(spage);
	}
	@Override
	public List<ProductVO> optionsearchList(Searchpage spage) {
		return dao.optionsearchList(spage);
	}
	
	
	// 기본 CRUD	+ countUp
	@Override
	public List<ProductVO> selectList() {
		// TODO 상품 리스트
		return dao.selectList();
	}
	@Override
	public ProductVO selectOne(ProductVO vo) {
		// TODO 상품 디테일
		return dao.selectOne(vo);
	}
	@Override
	public int insert(ProductVO vo) {
		// TODO 추가
		return dao.insert(vo);
	}
	@Override
	public int update(ProductVO vo) {
		// TODO 수정
		return dao.update(vo);
	}
	@Override
	public int delete(ProductVO vo) {
		// TODO 삭제 
		return dao.delete(vo);
	}
	@Override
	public int countUp(ProductVO vo) {
		// TODO 조회수 증가
		return dao.countUp(vo);
	}
}//class
