
public class StringMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// String str1 = "jslim", str2 = "jslim";
		String str1 = new String("jslim");
		String str2 = new String("jslim");

		if (str1 == str2) {
			System.out.println("str1 == str2");
		} else {
			System.out.println("str1 != str2");
		}

		if (str1.equals(str2)) {
			System.out.println("str1.equals(str2)");
		} else {
			System.out.println("str1 not equals(str2)");
		}

	}

}  
