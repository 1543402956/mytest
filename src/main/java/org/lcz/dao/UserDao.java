package org.lcz.dao;

import java.util.List;

import org.lcz.entity.User;

public interface UserDao {
  public User getUser(String username,String password);
  public int insertUser(User u);
  public int updateUser(User u);
 public List<User> getUserByFenye(String id, String index);
}
