package vo;

import lombok.Data;

@Data
public class OrdersVO {
	private int ordersnum;
	private String id;
	private int productnum;
	private int quantity; // 장바구니 수량을 담아올 변수
	
	private String pname; 
	private int money; 
	private int price2;
	private String image; 
}
