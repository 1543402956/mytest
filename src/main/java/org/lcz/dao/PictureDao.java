package org.lcz.dao;

import java.util.List;

import org.lcz.entity.Picture;

public interface PictureDao {
	
  public int insertFile(Picture p);

  public List<Picture> getPicById(String id,int index);
  //根据用户的id查询用户上传的图片
  public List<Picture> findPictureByUser(String id);
  //查询所有的图片
  public List<Picture> findPictures(int index);
  //根据图片的名称查询图片
  public Picture findPictureByfname(String name);

 public Picture findPicByuserIdAndfname(String fname, String id);
    //根据id删除图片
   public int deletePicById(String id);
}
