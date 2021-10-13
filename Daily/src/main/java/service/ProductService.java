package service;

import java.util.List;

import Pageing.Searchpage;
import vo.ProductVO;

public interface ProductService {


	
	public int searchRowsCount(Searchpage spage);
	public List<ProductVO> keywordsearchList(Searchpage spage);
	public List<ProductVO> optionsearchList(Searchpage spage);
	
	// 기본 CRUD
	List<ProductVO> selectList();
	ProductVO selectOne(ProductVO vo);
	int insert (ProductVO vo);
	int update (ProductVO vo);
	int delete (ProductVO vo);
	int countUp(ProductVO vo);
	
}//interface
