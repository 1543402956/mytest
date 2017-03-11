package org.lcz.service;

import java.util.List;

import org.lcz.entity.Concer;

public interface ConcerService {
  public int addConcer(Concer con,String id);

 public  List<Concer> getConceredByid(String id);

  public List<Concer> getConcerByid(String id);//查询关注我的人

 public int deleteByConcerned_id(String id, String id2);
}
