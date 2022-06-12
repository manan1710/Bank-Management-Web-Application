package bean;

import java.sql.Timestamp;

public class Login 
{
	String ws_username;
	String ws_password;
	Timestamp ws_timestamp;
	
	public String getWs_username()
	{
		return ws_username;
	}
	public void setWs_username(String ws_username) 
	{
		this.ws_username = ws_username;
	}
	public String getWs_password() 
	{
		return ws_password;
	}
	public void setWs_password(String ws_password)
	{
		this.ws_password = ws_password;
	}
	public Timestamp getWs_timestamp()
	{
		return ws_timestamp;
	}
	public void setWs_timestamp(Timestamp ws_timestamp) 
	{
		this.ws_timestamp = ws_timestamp;
	}
}
