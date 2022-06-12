package service;

import bean.Login;
import dao.LoginDao;

public class LoginServiceImpl implements LoginService
{

	@Override
	public boolean check(Login l) 
	{
		return LoginDao.check(l);
	}
}
