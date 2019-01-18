import sinc.tv.factory.TVFactory;
import sinc.tv.util.TV;

public class TVMain {

	public static void main(String[] args) {

		TVFactory factory = TVFactory.getInstance();
		TV tv = factory.getBrand("lg");
		tv.turnOn();
	}

}
