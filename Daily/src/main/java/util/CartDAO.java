package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.FAQVO;

@Repository
public class CartDAO {

	
	@Autowired
	private	SqlSession sqlSession ;
	
	private static final String NS = "daily.mapper.CartMapper.";
	// list
	public List<CartVO> cartMoney(){
		return null;
	}
	
	// insert 장바구니 담기
	public int addCart(CartVO cvo) {
		return sqlSession.insert(NS+"addCart",cvo);
	}
	
	// list 장바구니 목록 
	public List<CartVO> cartList(String loginInfo){
		return sqlSession.selectList(NS+"cartList",loginInfo);
	}
	
	// 장바구니 전체 삭제
	public int deleteAll(CartVO cvo) {
		return sqlSession.delete(NS+"deleteAll",cvo);
	}
	
	// 장바구니 개별 삭제
	public int deleteCart(CartVO cvo) {
		return sqlSession.delete(NS+"deleteCart", cvo.getCartnum());
	}
	
	// 장바구니 금액합계
	public int sumMoney(String loginInfo) {
		return sqlSession.selectOne(NS+"sumMoney", loginInfo);
	}
	
	// 장바구니 상품갯수
	public int countCart(String id, int productnum) {
		return 0;
	}
	
	// 장바구니 업데이트 (상품 수량 수정하는 메서드)
	public int updateCart(CartVO cvo) {
		return sqlSession.update(NS+"updateCart", cvo);
	}
	
}//class
