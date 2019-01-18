package sinc.model.vo;

public class PersonVO {

	private String	name;
	private int 	age;
	private String	address;
	
	private int 	division;
	
	public PersonVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PersonVO(int division, String name, int age, String address) {
		super();
		this.division = division;
		this.name = name;
		this.age = age;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getDivision() {
		return division;
	}
	public void setDivision(int division) {
		this.division = division;
	}
	public String perInfo() {
		
		return this.getName() +"\t" + this.getAge() + "\t" + this.getAddress();
	}
}
