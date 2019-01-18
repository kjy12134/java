package sinc.tv.model.vo;

import sinc.tv.util.TV;

public class LTV implements TV {

	@Override
	public void turnOn() {
		System.out.println("LTV turnOn");
	}
}
