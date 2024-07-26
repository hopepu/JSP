package model1.board;

import java.sql.Date;

public class BoardDTO {
	@Override //객체를 문자열로 변환하여 콘솔 출력
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", contents=" + contents + ", id=" + id + ", postdate="
				+ postdate + ", visitcount=" + visitcount + ", name=" + name + "]";
	}

	//필드
	private String num;
	private String title;
	private String contents;
	private String id;
	private Date postdate;
	private String visitcount;
	private String name;

	//생성자
	public BoardDTO() {
	//기본 생성자	
	}
	
	//메서드
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}