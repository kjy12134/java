
public class AryMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 로또번호 6개 추출, 중복제외, 뽑힌 숫자는 정렬해서
		int[] arr = null;

		while (true) {
			arr = getNewArr();

			if (!isDuplicated(arr)) {
				sort(arr);
				displayPrt(arr);
				break;
			} else {
				System.out.println("중복!!");
				displayPrt(arr);
			}
		}
	}

	public static void displayPrt(int[] ary) {

		for (int n : ary) {
			System.out.print(n + "\t");
		}
		System.out.println();

	}

	public static boolean isDuplicated(int[] arr) {
		boolean isDupulicated = false;

		loop1: for (int i = 0; i < arr.length - 1; i++) {
			int a = arr[i];
			for (int j = i + 1; j < arr.length; j++) {
				if (a == arr[j]) {
					isDupulicated = true;
					break loop1;
				}
			}
		}
		return isDupulicated;
	}

	public static int[] getNewArr() {
		int[] luckAry = new int[6];
		for (int i = 0; i < luckAry.length; i++) {
			luckAry[i] = (int) (Math.random() * 46) + 1;
		}
		return luckAry;
	}

	public static void sort(int[] arr) {

		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = 0; j < arr.length - 1; j++) {

				if (arr[j] > arr[j + 1]) {
					int tmp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = tmp;
				}
			}
		}
	}

}
