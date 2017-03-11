package org.lcz.service.impl;

import java.util.List;
import java.util.UUID;

import org.lcz.dao.PictureDao;
import org.lcz.entity.Picture;
import org.lcz.entity.User;
import org.lcz.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PictureServiceImpl implements PictureService {
    
	@Autowired
	private PictureDao pictureDao;
	@Override 
	public int addFile(Picture p) {
		// TODO Auto-generated method stub
		p.setId(UUID.randomUUID().toString().substring(0, 10));
		//p.setUser(new User("e0e2b2e9-7"));
		return this.pictureDao.insertFile(p);
	}
	
	
	
	
	public PictureDao getPictureDao() {
		return pictureDao;
	}
	public void setPictureDao(PictureDao pictureDao) {
		this.pictureDao = pictureDao;
	}




	@Override
	public List<Picture> findPicById(String id,int index) {
		// TODO Auto-generated method stub
		return this.pictureDao.getPicById(id,index);
	}




	@Override
	public List<Picture> findPictures(int index) {
		// TODO Auto-generated method stub
		return this.pictureDao.findPictures(index);
	}




	@Override
	public Picture findPictureByfname(String name) {
		// TODO Auto-generated method stub
		return this.pictureDao.findPictureByfname(name);
	}




	@Override
	public Picture findPicByuserIdAndfname(String fname, String id) {
		// TODO Auto-generated method stub
		return this.pictureDao.findPicByuserIdAndfname(fname,id);
	}




	@Override
	public int deletePicById(String id) {
		// TODO Auto-generated method stub
		return this.pictureDao.deletePicById(id);
	}
   
}
