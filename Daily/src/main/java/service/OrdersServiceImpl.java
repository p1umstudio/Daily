package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.OrdersDAO;
import vo.OrdersVO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	OrdersDAO dao;
	
	@Override
	public List<OrdersVO> ordersList(OrdersVO vo) {
		return dao.ordersList(vo);
	}
	
	@Override
	public int deleteOne(OrdersVO vo) {
		return dao.deleteOne(vo);
	}
	
	
}