package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import bean.Login;
import util.DbConnection;

public class LoginDao
{
	public static boolean check(Login l)
	{
		try
		{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select ws_password from login where ws_username = ? ");
			ps.setString(1, l.getWs_username());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				if(rs.getString(1).equals(l.getWs_password()))
				{
					PreparedStatement ps1 = con.prepareStatement("update login set ws_timestamp = ? where ws_username = ?");
					ps1.setTimestamp(1, l.getWs_timestamp());
					ps1.setString(2, l.getWs_username());
					int status = ps1.executeUpdate();
					if(status == 1)
					{
						return true;
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
//	public static void main(String args[])
//	{
//		Login l = new Login();
//		l.setWs_username("admin");
//		l.setWs_password("admin");
//		Date date = new Date();
//		Timestamp ts = new Timestamp(date.getTime());
//		l.setWs_timestamp(ts);
//		
//		System.out.println(check(l));
//	}
}
