package sinc.model.vo.sub;

import sinc.model.vo.PersonVO;

public class EmpVO extends PersonVO {

	private String dept;

	public EmpVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmpVO(int division, String name, int age, String address, String dept) {
		super(division, name, age, address);
		this.dept = dept;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String empInfo() {
		return super.perInfo() + "\t" + getDept();
	}

	public String perInfo() {
		return super.perInfo() + "\t" + getDept();
	}
}
