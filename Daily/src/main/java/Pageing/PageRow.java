package Pageing;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageRow {
	private int rowPerPage; // 1페이지당 row개수
	private int	currPage; // 현재페이지
	private int sno ; // 열(목록)시작번호 
	private int eno ; // 열(목록)끝번호  
	private int offset_sno ; // 디비에 시작 열 번호 
	
	
	
	
	public PageRow() {
		this.rowPerPage=4;
		this.currPage=1;
	}
	
	public void setCurrpage(int currPage) {
		if (currPage> 1) {
			this.currPage=currPage;
		}
		else this.currPage=1;
	}
	
	public void setRowsPerPage(int rowPerPage) {
		if (rowPerPage<4 || rowPerPage>50) {
			this.rowPerPage=4;
		}
		else this.rowPerPage=rowPerPage;
	}
	
	public void setSnoEno() {
		if (this.sno<1) this.sno=1;
		
		this.sno=(this.currPage-1)*this.rowPerPage+1;
		System.out.println("sno=>"+sno);
		this.eno=this.sno + this.rowPerPage -1; 
		
		this.offset_sno=(this.currPage-1)*this.rowPerPage;
		System.out.println("offset_sno=>"+offset_sno);
	}

}//PageRow
