import java.util.Iterator;
import java.util.List;

import com.sinc.factory.FactoryBiz;
import com.sinc.factory.FactoryVO;

public class FactoryMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		FactoryBiz biz = new FactoryBiz();
		List<FactoryVO> list = biz.getFactoryAll();
		Iterator<FactoryVO> ite = list.iterator();
		FactoryVO vo = null;
		while(ite.hasNext()) {
			vo = ite.next();
			System.out.println(vo.getFacname() +"\t"
					+ vo.getFacno() + "\t" +
					vo.getFacloc());
		}
	}

}
