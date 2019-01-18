import com.sinc.exception.Account;

public class AccountMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Account account = new Account("441-0290-1203",500000, 7.3);
		System.out.println(account);
		account.deposit(-10);
//		account.deposit(50000);
//		System.out.println(account);
		account.withdraw(600000);
//		account.withdraw(400000);
//		System.out.println(account);
		System.out.println(account.calculateInterest());
	}

}
