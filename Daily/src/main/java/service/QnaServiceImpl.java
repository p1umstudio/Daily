package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.QnaDAO;
import vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	public QnaDAO dao ; 
	
	@Override
	public int replyInsert(QnaVO vo) {
		return dao.replyInsert(vo);
	}
	
// 기본 CRUD =================================================	
	@Override
	public List<QnaVO> selectList() {
		return dao.selectList();
	}
	@Override
	public QnaVO selectOne(QnaVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(QnaVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(QnaVO vo) {
		return dao.update(vo);
	}
	@Override
		public int delete(QnaVO vo) {
			return dao.delete(vo);
		}	
	
}// class
