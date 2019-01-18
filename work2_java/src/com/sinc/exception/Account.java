package com.sinc.exception;

public class Account {

	private String account;
	private double balance, interestRate;

	public Account() {
	}

	public Account(String account, double balance, double interestRate) {
		this.account = account;
		this.balance = balance;
		this.interestRate = interestRate;
	}

	public double calculateInterest() {
		return (balance * (interestRate / 100));
	}

	public void deposit(double money) { // 입금액이 0보다 적으면 exception 발생
		// throw new Exception();

		try {
			if (money < 0) {
				throw new Exception(); // exception 발생시키기
			} else {
				this.balance += money;
			}
		} catch (Exception e) {
			System.out.println("입금 금액이 0보다 적습니다.");
		}
	}

	public void withdraw(double money) { // 출금액이 0보다 적으면 exception발생, 현재잔액보다 많아도 발생

		try {
			if (money < 0 || money > balance) {
				throw new Exception();
			} else {
				this.balance -= money;
			}

		} catch (Exception e) {
			System.out.println("금액이 0보다 적거나 현재 잔액보다 많습니다.");
		}
	}

	@Override
	public String toString() {
		return "Account [account=" + account + ", balance=" + balance + ", interestRate=" + interestRate + "]";
	}

}
