package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.CartDAO;
import vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public CartDAO dao;

	@Override
	public int addCart(CartVO cvo) {
		return dao.addCart(cvo);
	}
	@Override
	public List<CartVO> cartMoney() {
		return null;
	}
	@Override
	public List<CartVO> cartList(String id) {
		return dao.cartList(id);
	}
	@Override
	public int deleteAll(CartVO cvo) {
		return dao.deleteAll(cvo);
	}
	@Override
	public int deleteCart(CartVO cvo) {
		return dao.deleteCart(cvo);
	}
	@Override
	public int sumMoney(String id) {
		return dao.sumMoney(id);
	}
	@Override
	public int countCart(String id, int productnum) {
		return 0;
	}
	@Override
	public int updateCart(CartVO cvo) {
		return dao.updateCart(cvo);
	}
}//class



