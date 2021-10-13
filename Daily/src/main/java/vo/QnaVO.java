package vo;

import lombok.Data;

@Data
public class QnaVO {
	private int qnanum ;
	private String id;
	private String title;
	private String content;
	private int root ;
	private int step;
	private String date;
	private char state; //게시글 상태 T or F
	private int secret; //공개 여부 '1' or '2'
}
