package service;

import java.util.List;

import vo.OrdersVO;


public interface OrdersService {

//----------------------------------------------
	
	List<OrdersVO> ordersList(OrdersVO vo);
	int deleteOne (OrdersVO vo);
}
