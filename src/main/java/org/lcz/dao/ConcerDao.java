package org.lcz.dao;

import java.util.List;

import org.lcz.entity.Concer;

public interface ConcerDao {
  public int addConcer(Concer con,String id);

  public  List<Concer> getConceredById(String id);

   public List<Concer> getConcerById(String id); //查询关注我的人

  public int deleteByConcerned_id(String id, String id2);
}
