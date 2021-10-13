package vo;

import lombok.Data;

@Data
public class MemberVO {
	private String id; 
	private String pw; 
	private String name; 
	private String address; 
	private String phone; 
	private String birth; 
	private char state; 
	private String date; 
	private int lv ; 
	private int money; 
	private int point; 
}
