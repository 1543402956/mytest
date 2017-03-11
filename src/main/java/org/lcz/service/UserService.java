package org.lcz.service;

import java.util.List;

import org.lcz.entity.User;

public interface UserService {
   public User login(String username,String password);
   public int addUser(User u);
   public int modifyUser(User u);
  public List<User> findUserByFenye(String id, String index);
}
