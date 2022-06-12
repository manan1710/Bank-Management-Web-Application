package service;

import java.util.ArrayList;

import bean.Customer;

public interface CustomerService 
{	
	public int createCustomer(Customer c);
	public Customer getCustomerBySSN(long ssn);
	public Customer getCustomerByID(long custid);
	public int deleteCustomer(long custid);
	public int updateCustomer(Customer c);
	public ArrayList<Customer> readAllcustomer();
}
