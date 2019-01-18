package sinc.excep;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

public class ExceptionDemo {

	public ExceptionDemo() {

	}

	public void runTimeE() {
		Scanner scan = null;
		System.out.print("원하시는 번호를 입력하세요 :  ");
		
		try {
			scan = new Scanner(System.in);
			int num = scan.nextInt();
			System.out.println(num);
			
		} catch (Exception e) {
			System.out.println("catch");
			runTimeE();
		}
		
	}

	//BufferedReader
	public void complieE() {
		File file = new File("C:\\test.txt");
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(file));
			String line = null;
			while ((br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// Scanner
	public void complieE2() {
		File file = new File("C:\\test.txt");
		Scanner scan = null;
		try {
			scan = new Scanner(new FileReader(file));
			while (scan.hasNextLine() == true) {
				System.out.println(scan.nextLine());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				scan.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
