package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.OrdersVO;

@Repository
public class OrdersDAO {
	
	@Autowired
	private SqlSession sqlSession ;
	
	private static final String NS = "daily.mapper.OrdersMapper.";
	
	// WishList
	public List<OrdersVO> ordersList(OrdersVO vo) {
		return sqlSession.selectList(NS+"ordersList",vo);
	}

	public int deleteOne(OrdersVO vo) {
		return sqlSession.delete(NS + "deleteOne", vo);
	}




 










}//class 
