package sinc.tv.factory;

import sinc.tv.model.vo.LTV;
import sinc.tv.model.vo.STV;
import sinc.tv.util.TV;

public class TVFactory {

	private static TVFactory instance;
	private TV[] ary;
	
	private TVFactory() {
		ary = new TV[2];
		ary[0] = new STV();
		ary[1] = new LTV();
	}
	
	public static TVFactory getInstance() {
		
		if(instance == null) {
			instance = new TVFactory();
		}
		return instance;
	}
	
	public TV getBrand(String brand) {
		return (brand.equals("samsung") ? ary[0] : ary[1]);
	}
}

