package vo;

import lombok.Data;

@Data
public class Product_qnaVO {
	private int prodqnanum;
	private String name;
	private String id;
	private String title;
	private String content;
	private int root ;
	private int step;
	private String date;
	private char state;
	private char secret;
}
 