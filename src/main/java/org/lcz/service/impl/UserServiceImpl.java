package org.lcz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.lcz.dao.UserDao;
import org.lcz.entity.User;
import org.lcz.service.UserService;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImpl implements UserService {
    
	@Resource
	private UserDao userDao;
	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
      return this.userDao.getUser(username, password);
	}

	@Override
	public int addUser(User u) {
		// TODO Auto-generated method stub
		return this.userDao.insertUser(u);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int modifyUser(User u) {
		// TODO Auto-generated method stub
		return this.userDao.updateUser(u);
	}

	@Override
	public List<User> findUserByFenye(String id, String index) {
		// TODO Auto-generated method stub
		return this.userDao.getUserByFenye(id,index);
	}
}
