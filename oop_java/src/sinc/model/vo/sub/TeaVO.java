package sinc.model.vo.sub;

import sinc.model.vo.PersonVO;

public class TeaVO extends PersonVO {
	private String subject;

	public TeaVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeaVO(int division, String name, int age, String address, String subject) {
		super(division, name, age, address);
		this.subject = subject;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String teaInfo() {
		return super.perInfo() + "\t" + getSubject();
	}
	
	public String perInfo() {
		return super.perInfo() + "\t" + getSubject();
	}
}
