import java.util.Iterator;
import java.util.List;

import model.sql.DaoImpl;
import model.util.Dao;
import model.vo.DeptVO;

public class OracleMain {

	public static void main(String[] args) {
		Dao dao = new DaoImpl(); // factory pattern
		
		
		List<Object> list = dao.selectAll();
		Iterator<Object> ite = list.iterator(); // collection이랑 싱크 맞춰야 함
		while(ite.hasNext()) {
			System.out.println(ite.next());
		}
		
		
		/*
		Object obj = dao.selectOne("10");
		
		if(obj == null) {
			System.out.println("record not found!");
		} else {
			System.out.println(obj);
		}
		*/
		
		
		DeptVO obj = new DeptVO("25","HR","A1");
		int flag = dao.insert(obj);
		if(flag == 1) {
			System.out.println("success");
		} else {
			System.out.println("error");
		}

	}

}
