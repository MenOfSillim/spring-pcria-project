package com.pcria.main.model;

import java.util.List;

public class CountingDMI extends FoodVO {
	private int totalPayment;
	private List<CountingDMI> countingList;
	private int total_quantity;
	private int total_price;
	private String food_request;
	
	public List<CountingDMI> getCountingList() {
		return countingList;
	}

	public void setCountingList(List<CountingDMI> countingList) {
		this.countingList = countingList;
	}

	public int getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getFood_request() {
		return food_request;
	}

	public void setFood_request(String food_request) {
		this.food_request = food_request;
	}
}
