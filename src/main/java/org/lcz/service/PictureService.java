package org.lcz.service;

import java.util.List;

import org.lcz.entity.Picture;

public interface PictureService {
   public int addFile(Picture p);
   public List<Picture> findPicById(String id,int index);
 //查询所有的图片
   public List<Picture> findPictures(int index);
   //根据图片名称查询图片
   public Picture findPictureByfname(String name);
  public Picture findPicByuserIdAndfname(String fname, String id);
  //根据图片id删除图片
  public int deletePicById(String id);
}
