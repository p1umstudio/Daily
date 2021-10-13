package vo;

import lombok.Data;

@Data
public class CartVO {
	private int cartnum; // 장바구니 번호
	private String id; // 회원 아이디
	private int productnum; // 상품 넘버
	private int quantity; // 고른 상품 수량
	private String date; // 날짜
	
	private String pname; // 상품명
	private int money; // 총금액
	private int price2; // 상품금액
	private String image; //상품 이미지
	
}
