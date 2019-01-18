package model.vo;

public class DeptVO {
	// DEPT table 컬럼 이름과 동일
	private String dept_id, dept_name, loc_id;
	
	public DeptVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeptVO(String dept_id, String dept_name, String loc_id) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.loc_id = loc_id;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(String loc_id) {
		this.loc_id = loc_id;
	}

	@Override
	public String toString() { // 디버깅용
		return "DeptVO [dept_id=" + dept_id + ", dept_name=" + dept_name + ", loc_id=" + loc_id + "]";
	}

	
}
