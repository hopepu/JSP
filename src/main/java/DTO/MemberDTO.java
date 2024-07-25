package DTO;

public class MemberDTO {
	//필드
	private String regDate;
	private String name;
	private String pass;
	private String id;
	//생성자
	public MemberDTO(){
		//기본생성자		
	}
	
		
	public MemberDTO(String name, String pass, String id) {
		super();
		this.name = name;
		this.pass = pass;
		this.id = id;
	}
	
	//메서드
	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}




}
