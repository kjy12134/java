import sinc.model.vo.PersonVO;
import sinc.service.PerServiceImpl;
import sinc.util.Division;

public class OOPViewMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		PerServiceImpl service = new PerServiceImpl();
		System.out.println("**객체 생성** ");
		service.makePer(Division.STUDENT, "김지원", 30, "충무로", "2009");
		service.makePer(Division.TEACHER, "섭섭님", 30, "충무로", "2009");
		service.makePer(Division.EMPLOYEE, "박병준", 30, "창동", "시스템 개발");

		System.out.println("**정보 출력** ");
		// PERSON타입 배열 넘겨주기
		// getary안에 배열 만들고, 그 안에 makePer로 넘겨받은거 담아서 다시 리턴해
		PersonVO[] ary = service.getAry();
		displayAry(ary);

		System.out.println("** 상세 정보 출력 **");
		PersonVO findObj = service.findPer("섭섭님");
		// 변수 선언 = (조건식) ? true : false;

		String findMsg = (findObj == null) ? "데이터가 존재하지 않습니다." : findObj.perInfo();
		System.out.println(findMsg);

		System.out.println("**정보 삭제 후 객체생성 및 출력 **");

		boolean removeFlag = service.deletePer("섭섭님"); // 삭제 idx 정보 빼고 마지막 idx에 삽입

		if (removeFlag) { // 새로운 객체 추가
			service.makePer(Division.EMPLOYEE, "임정연", 25, "청량리", "백화점");
			ary = service.getAry();
			displayAry(ary);
		}

		boolean removeFlag2 = service.deletePer2("섭섭님"); // 삭제할 객체 null로 설정, 출력 시 null continue

		if (removeFlag2) {
			service.makePer(Division.EMPLOYEE, "임정연", 25, "청량리", "백화점");
			for (PersonVO p : service.getAry()) {
				if (p == null)
					continue;
				System.out.println(p.perInfo());
			}
		}

	}

	public static void displayAry(PersonVO[] arr) {
		for (PersonVO p : arr) {
			if (p == null) {
				break;
			}
			System.out.println(p.perInfo());
		}
	}

}
