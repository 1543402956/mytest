package org.lcz.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.lcz.dao.ConcerDao;
import org.lcz.entity.Concer;
import org.lcz.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ConcerDaoImp implements ConcerDao {
   
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public int addConcer(Concer con, String id) {
		// TODO Auto-generated method stu
		 Session session = this.getSessionFactory().getCurrentSession();
		 User user = (User) session.get(User.class, id);
		  con.setUserByConcernedId(user);
		  session.save(con);
		return 1;
	}

	@Override
	public  List<Concer> getConceredById(String id) {
		// TODO Auto-generated method stub
		String sql="from Concer con where con.userByConcernerId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setString(0, id);
		 List<Concer> list=query.list();
		return list;
	}

	@Override
	public List<Concer> getConcerById(String id) {
		// TODO Auto-generated method stub
		String sql="from Concer con where con.userByConcernedId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setString(0, id);
		 List<Concer> list=query.list();
		return list;
	}

	@Override
	public int deleteByConcerned_id(String id, String id2) {
		// TODO Auto-generated method stub
		String sql="delete from Concer con where con.userByConcernerId=? and userByConcernedId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setString(0, id2);
		query.setString(1, id);
		int result = query.executeUpdate();
		return result;
	}

}
