package DTO;

import java.sql.Date;

public class BoardDTO {
	//필드
	private int visitCount;
	private Date posDate;
	private String id;
	private String Contents;
	private String Title;
	private int num;
	
	//생성자

	
	//메서드
	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public Date getPosDate() {
		return posDate;
	}

	public void setPosDate(Date posDate) {
		this.posDate = posDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContents() {
		return Contents;
	}

	public void setContents(String contents) {
		Contents = contents;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	


}
