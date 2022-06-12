package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Account;
import bean.Customer;
import util.DbConnection;

public class CustomerDao 
{
	
	public static long generateCustomerId() {
		try {
			Connection con = DbConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(ws_cust_id) from customer");

			while (rs.next()) {
				long id = rs.getLong(1);
				return id == 0 ? 100000000 : id + 1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return -1;
	}
	
	
	public static int createCustomer(Customer c) 
	{
		int status = 0;
		try
		{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into customer (ws_ssn, ws_cust_id, ws_name, ws_adrs, ws_city, ws_state, ws_age, ws_status, ws_msg) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			long cust_id = generateCustomerId();
			
			ps.setLong(1, c.getWs_ssn());
			ps.setLong(2, cust_id);
			ps.setString(3, c.getWs_name());
			ps.setString(4, c.getWs_adrs());
			ps.setString(5, c.getWs_city());
			ps.setString(6, c.getWs_state());
			ps.setInt(7, c.getWs_age());
			ps.setString(8, Character.toString(c.getWs_status()));
			ps.setString(9, c.getWs_msg());

			status = ps.executeUpdate();
			con.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return status;
	}
	
	public static Customer getCustomerBySSN(long ssn) {
		Customer c = new Customer();
		try
		{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from customer where ws_ssn = ?");
			ps.setLong(1, ssn);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				c.setWs_ssn(rs.getLong(1));
				c.setWs_cust_id(rs.getLong(2));
				c.setWs_name(rs.getString(3));
				c.setWs_adrs(rs.getString(4));
				c.setWs_city(rs.getString(5));
				c.setWs_state(rs.getString(6));
				c.setWs_age(rs.getInt(7));
				c.setWs_status(rs.getString(8).charAt(0));
				c.setWs_msg(rs.getString(9));
				c.setWs_last_update(rs.getTimestamp(10));
			}
			
			con.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		
		return c;
	}
	
	public static Customer getCustomerByID(long custid) {
		Customer c = new Customer();
		try
		{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from customer where ws_cust_id = ?");
			ps.setLong(1, custid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				c.setWs_ssn(rs.getLong(1));
				c.setWs_cust_id(rs.getLong(2));
				c.setWs_name(rs.getString(3));
				c.setWs_adrs(rs.getString(4));
				c.setWs_city(rs.getString(5));
				c.setWs_state(rs.getString(6));
				c.setWs_age(rs.getInt(7));
				c.setWs_status(rs.getString(8).charAt(0));
				c.setWs_msg(rs.getString(9));
				c.setWs_last_update(rs.getTimestamp(10));
			}
			
			con.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		
		return c;
	}
	
	public static int deleteCustomer(long custid)
	{
		int status = 0;
		try {
			Connection con = DbConnection.getConnection();
			//PreparedStatement ps = con.prepareStatement("delete from customer where ws_cust_id = ?");
			PreparedStatement ps = con.prepareStatement("update customer set ws_status = ?, ws_msg = ? where ws_cust_id = ?");
			ps.setString(1, "I");
			ps.setString(2, "Account Deactivated");
			ps.setLong(3, custid);
			
			status = ps.executeUpdate();
			con.close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
	
	public static int updateCustomer(Customer c)
	{
		int status = 0;
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update customer set ws_name = ?, ws_adrs = ?, ws_city = ?, ws_state = ? ,  ws_age = ?, ws_msg = ? where ws_cust_id = ? and ws_ssn = ?");
			ps.setString(1, c.getWs_name());
			ps.setString(2, c.getWs_adrs());
			ps.setString(3, c.getWs_city());
			ps.setString(4, c.getWs_state());
			ps.setInt(5, c.getWs_age());
			ps.setString(6, c.getWs_msg());
			ps.setLong(7, c.getWs_cust_id());
			ps.setLong(8, c.getWs_ssn());
			
			status = ps.executeUpdate();
			con.close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return status;
	}
	
	public static ArrayList<Customer> readAllcustomer()
	{
		ArrayList<Customer> customer = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customer");
			while (rs.next()) {
				Customer c = new Customer();
				c.setWs_ssn(rs.getLong(1));
				c.setWs_cust_id(rs.getLong(2));
				c.setWs_name(rs.getString(3));
				c.setWs_adrs(rs.getString(4));
				c.setWs_city(rs.getString(5));
				c.setWs_state(rs.getString(6));
				c.setWs_age(rs.getInt(7));
				c.setWs_status(rs.getString(8).toCharArray()[0]);
				c.setWs_msg(rs.getString(9));
				c.setWs_last_update(rs.getTimestamp(10));
				customer.add(c);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return customer;
	}
}
