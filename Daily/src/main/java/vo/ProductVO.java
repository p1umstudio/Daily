package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	private int productnum;
	private String pname;
	private String content;
	private String date;
	private String image; //출력할 DB에 저장된 이미지 경로 및 파일명
	private char state; // 판매상태(판매중'T'<->'F')
	private int price1 ; //원가
	private int price2 ; //판매가
	private int price3 ; //순이익
	private int quantity1; //입고수량
	private int quantity2; //재고수량
	private char kind; //종류
	//(1-상의, 2-하의, 3-아우터, 4-가방)
	private int count ; //조회수
	private int score; //상품평
	
    private MultipartFile imagef; 
	//입력시 form에 이미지 정보를 전달받기위한 매개변수 특별한 파일
	
}
