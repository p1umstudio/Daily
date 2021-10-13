package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.WishListDAO;
import vo.WishListVO;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	WishListDAO dao;
	
	@Override
	public List<WishListVO> WishList(WishListVO vo) {
		return dao.WishList(vo);
	}
	
	@Override
	public int deleteOne(WishListVO vo) {
		return dao.deleteOne(vo);
	}
	
}