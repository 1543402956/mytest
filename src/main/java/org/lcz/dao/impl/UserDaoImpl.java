package org.lcz.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.lcz.dao.UserDao;
import org.lcz.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class UserDaoImpl implements UserDao {
     
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public User getUser(String username, String password) {
		// TODO Auto-generated method stub
		String sql="from User where username=:uname and password=:pwd";
		Session session = this.sessionFactory.getCurrentSession();
		 Query query = session.createQuery(sql);
		 query.setString("uname", username);
		 query.setString("pwd", password);
		 User user = (User) query.uniqueResult();
		 if(user!=null){
			 return user;
		 }
		 return null;
	}

	@Override
	public int insertUser(User u) {
		UUID randomUUID = UUID.randomUUID();
		  String id = randomUUID.toString();
		  u.setId(id.substring(0, 10));
		  try{
			  Session session = this.sessionFactory.getCurrentSession();
			  session.save(u);
		    return 1;
		   }catch(Exception e){
		     return 0;
		  }
	}
	
	@Override
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(u);
		return 1;
	}
	@Override
	public List<User> getUserByFenye(String id, String index) {
		// TODO Auto-generated method stub
		String sql="from User u where u.id<>? and u.id not in(select userByConcernedId from "
				+ "Concer c where c.userByConcernerId='"+id+"')";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
	     query.setString(0, id);
	     query.setFirstResult((Integer.parseInt(index)-1)*3);
	     query.setMaxResults(3);
	       List<User> list = query.list();
		   return list;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
