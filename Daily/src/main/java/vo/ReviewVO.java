package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewnum;
	private String pname;
	private String id;
	private String content;
	private String date;
	private char state; // 관리자의 숨김 
	private String image;
	private int root;
	private int step; 
	private int score;
	
	private MultipartFile imagef; 
	//입력시 form에 이미지 정보를 전달받기위한 매개변수 특별한 파일
}
