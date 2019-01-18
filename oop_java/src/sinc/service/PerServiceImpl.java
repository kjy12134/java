package sinc.service;

import sinc.model.vo.PersonVO;
import sinc.model.vo.sub.EmpVO;
import sinc.model.vo.sub.StuVO;
import sinc.model.vo.sub.TeaVO;
import sinc.util.Division;

public class PerServiceImpl {

	private PersonVO[] perAry; // 배열은 초기화 필수
	private int idx;

	public PerServiceImpl() {
		perAry = new PersonVO[10];
	}

	public void makePer(int division, String name, int age, String address, String comm) {
		PersonVO p = null;
		switch (division) {
		case Division.STUDENT: // student
			p = new StuVO(1, name, age, address, comm);
			break;

		case Division.TEACHER: // teacher
			p = new TeaVO(2, name, age, address, comm);
			break;

		case Division.EMPLOYEE: // employee
			p = new EmpVO(3, name, age, address, comm);
			break;
		}
		setAry(p);
	}

	private void setAry(PersonVO p) { // 매개변수 다형성
		perAry[idx++] = p;
	}

	public PersonVO[] getAry() {
		return perAry;
	}

	public PersonVO findPer(String name) {

		for (PersonVO p : perAry) {
			if (p != null) {
				if (p.getName().equals(name)) {
					return p;
				}
			}
		}
		return null;
	}

	// 삭제 idx 정보 빼고 마지막 idx에 삽입
	public boolean deletePer(String name) {
		for (int i = 0; i < perAry.length; i++) {

			PersonVO p = perAry[i];

			if (p.getName().equals(name)) {
				for (int j = i; j < perAry.length - 1; j++) {
					perAry[j] = perAry[j + 1];
				}
				idx--;
				return true;
			}
		}
		return false;
	}

	// 삭제할 객체 null로 설정, view에서 출력할 때 null continue
	public boolean deletePer2(String name) {
		
		for (int i = 0; i < perAry.length; i++) {
			if ((perAry[i] != null) && (perAry[i].getName().equals(name))) {
				
				perAry[i] = null;
				return true;
			}
		}
		return false;
	}
}
