package common;

public class Person {
	//자바빈즈 규약
	// 1 필드값은 접근지정자로 private을 사용한다.
	// 2 클래스 분류는 default 이외의 package에 속해야한다.
	// 3 기본생성자가 필요하다
	// 4 getter/setter 필요하다
	// 5 getter/setter 접근지정자로 public을 사용한다.
	
	//필드
	private String name;
	private int age;
	
	//생성자
	public Person(){} //기본생성자
	
	public Person(String name, int age) { // 커스텀 생성자
		super();
		this.name = name;
		this.age = age;
	}
	
	//메서드

	

	public String getName() { return name;	}
	public void setName(String name) {	this.name = name; }
	public int getAge() {	return age;	}
	public void setAge(int age) {	this.age = age;	}

}
