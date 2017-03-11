package org.lcz.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.lcz.dao.ConcerDao;
import org.lcz.entity.Concer;
import org.lcz.service.ConcerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConcerServiceImpl implements ConcerService {
   @Autowired
	private ConcerDao concerDao;
   
	public ConcerDao getConcerDao() {
	return concerDao;
}

public void setConcerDao(ConcerDao concerDao) {
	this.concerDao = concerDao;
}

	@Override
	public int addConcer(Concer con, String id) {
		// TODO Auto-generated method stub
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd mm:HH:ss");
		 con.setConcernTime(sdf.format(new Date()));
		return this.concerDao.addConcer(con, id);
	}

	@Override
	public  List<Concer> getConceredByid(String id) {
		// TODO Auto-generated method stub
		return this.concerDao.getConceredById(id);
	}

	@Override
	public List<Concer> getConcerByid(String id) {
		// TODO Auto-generated method stub
		return this.concerDao.getConcerById(id);
	}
   /**
    * 取消关注用户
    */
	@Override
	public int deleteByConcerned_id(String id, String id2) {
		// TODO Auto-generated method stub
		  return this.concerDao.deleteByConcerned_id(id,id2);
	}

}
