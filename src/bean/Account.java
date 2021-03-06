package bean;

import java.sql.Timestamp;

public class Account 
{
	long ws_cust_id;
	long ws_acct_id;
	String ws_acct_type;
	String ws_acct_status;
	long ws_acct_balance;
	Timestamp ws_acct_crdate;
	String ws_msg;
	Timestamp ws_trxn_ts;
	
	@Override
	public String toString() {
		return "Account [ws_cust_id=" + ws_cust_id + ", ws_acct_id=" + ws_acct_id + ", ws_acct_type=" + ws_acct_type
				+ ", ws_acct_status=" + ws_acct_status + ", ws_acct_balance=" + ws_acct_balance + ", ws_acct_crdate="
				+ ws_acct_crdate + ", ws_msg=" + ws_msg + ", ws_trxn_ts=" + ws_trxn_ts + "]";
	}
	
	public long getWs_cust_id() 
	{
		return ws_cust_id;
	}
	public void setWs_cust_id(long ws_cust_id) 
	{
		this.ws_cust_id = ws_cust_id;
	}
	public long getWs_acct_id()
	{
		return ws_acct_id;
	}
	public void setWs_acct_id(long ws_acct_id) 
	{
		this.ws_acct_id = ws_acct_id;
	}
	public String getWs_acct_type() 
	{
		return ws_acct_type;
	}
	public void setWs_acct_type(String ws_acct_type)
	{
		this.ws_acct_type = ws_acct_type;
	}
	public String getWs_acct_status() 
	{
		return ws_acct_status;
	}
	public void setWs_acct_status(String ws_acct_status) 
	{
		this.ws_acct_status = ws_acct_status;
	}
	public long getWs_acct_balance()
	{
		return ws_acct_balance;
	}
	public void setWs_acct_balance(long ws_acct_balance) 
	{
		this.ws_acct_balance = ws_acct_balance;
	}
	public Timestamp getWs_acct_crdate() 
	{
		return ws_acct_crdate;
	}
	public void setWs_acct_crdate(Timestamp  ws_acct_crdate)
	{
		this.ws_acct_crdate = ws_acct_crdate;
	}
	public String getWs_msg() 
	{
		return ws_msg;
	}
	public void setWs_msg(String ws_msg) 
	{
		this.ws_msg = ws_msg;
	}
	public Timestamp getWs_trxn_ts() 
	{
		return ws_trxn_ts;
	}
	public void setWs_trxn_ts(Timestamp ws_trxn_ts) 
	{
		this.ws_trxn_ts = ws_trxn_ts;
	}
}
