package org.lcz.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.lcz.dao.PictureDao;
import org.lcz.entity.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PictureImp implements PictureDao {
    @Autowired
	private SessionFactory sessionFactory;
	@Override
	public int insertFile(Picture p) {
		// TODO Auto-generated method stub
		try{
			Session session = this.sessionFactory.getCurrentSession();
			session.save(p);
		return 1;
		}catch(Exception e){
			return 0;
		}
	}
	@Override
	public List<Picture> getPicById(String id,int index) {
		// TODO Auto-generated method stub
		int indexPage=index;
		int pageSize=3;
		String sql="from Picture where user_id='"+id+"'";
		Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setFirstResult((indexPage-1)*pageSize);
		query.setMaxResults(pageSize);
		 List<Picture> list =query.list();
		return list;
	}
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 查询用户上传的图片
	 */
	@Override
	public List<Picture> findPictureByUser(String id) {
		// TODO Auto-generated method stub
		String hql="from Picture p where p.user.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		 query.setString(0, id);
		 List<Picture> list = query.list();
		return list;
	}
	@Override
	public List<Picture> findPictures(int index) {
		String hql="from Picture";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult((index-1)*3);
		query.setMaxResults(3);
		 List<Picture> list = query.list();
		return list;
	}
	@Override
	public Picture findPictureByfname(String name) {
		// TODO Auto-generated method stub
		String hql="from Picture p where p.fname=?";
		Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		 query.setString(0, name);
		 Picture pic = (Picture) query.uniqueResult();
		return pic;
	}
	@Override
	public Picture findPicByuserIdAndfname(String fname, String id) {
		// TODO Auto-generated method stub
		 String hql="from Picture p where p.fname=? and p.user.id=?";
		 Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		  query.setString(0, fname);
		  query.setString(1, id);
		return (Picture) query.uniqueResult();
	}
	@Override
	public int deletePicById(String id) {
		// TODO Auto-generated method stub
         String hql="delete Picture where id='"+id+"'";
         Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
         int result=query.executeUpdate();
		return result;
	}
}
