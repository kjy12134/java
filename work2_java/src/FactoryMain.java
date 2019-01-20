import java.util.Iterator;
import java.util.List;

import com.sinc.factory.FactoryBiz;

public class FactoryMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		FactoryBiz biz = new FactoryBiz();
		List<Object> list = biz.getFactoryAll();
		Iterator<Object> ite = list.iterator();
		
		while(ite.hasNext()) {
			System.out.println(ite.next());
		}
	}

}
