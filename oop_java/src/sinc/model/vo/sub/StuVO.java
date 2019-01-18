package sinc.model.vo.sub;

import sinc.model.vo.PersonVO;

public class StuVO extends PersonVO {

	private String stuId;

	public StuVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StuVO(int division, String name, int age, String address, String stuId) {
		super(division, name, age, address);
		this.stuId = stuId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String stuInfo() {
		return super.perInfo() + "\t" + getStuId();
	}
	
	/*
	 * overriding
	 * super 명칭 필수
	 * 	부모 타입으로 자식 메소드에 대한 접근 가능
	 * */
	
	public String perInfo() { 
		return super.perInfo() + "\t" + getStuId();
	}
}
