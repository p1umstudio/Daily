package service;

import java.util.List;

import vo.WishListVO;


public interface WishListService {

//----------------------------------------------
	// 기본 CRUD
	
	List<WishListVO> WishList(WishListVO vo);
	int deleteOne (WishListVO vo);
}
