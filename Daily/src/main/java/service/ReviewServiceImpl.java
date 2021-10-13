package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.ReviewDAO;
import vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	public ReviewDAO dao ; 
	
	@Override
	public int replyInsert(ReviewVO vo) {
		return dao.replyInsert(vo);
	}
	
// 기본 CRUD =================================================	
	@Override
	public List<ReviewVO> selectList() {
		return dao.selectList();
	}
	@Override
	public ReviewVO selectOne(ReviewVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(ReviewVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(ReviewVO vo) {
		return dao.update(vo);
	}
	@Override
		public int delete(ReviewVO vo) {
			return dao.delete(vo);
		}	
	@Override
	public List<ReviewVO> myreview(ReviewVO vo) {
		return dao.myreview(vo);
	}
}// class
