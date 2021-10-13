package service;

import java.util.List;

import vo.CartVO;

public interface CartService {
	
	List<CartVO> cartMoney();
	int addCart(CartVO cvo);
	List<CartVO> cartList(String loginInfo);
	 int deleteCart(CartVO cvo); //장바구니 개별 삭제
	 int deleteAll(CartVO cvo); //장바구니 비우기
	 int sumMoney(String loginInfo); //장바구니 금액 합계
	 int countCart(String loginInfo, int productnum); //장바구니 상품 갯수
	 int updateCart(CartVO cvo); //장바구니 수량 수정
	
	
}//class
