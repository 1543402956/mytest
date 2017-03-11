package org.lcz.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.lcz.entity.Concer;
import org.lcz.entity.User;
import org.lcz.service.ConcerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/concern")
public class ConcernController {
	 @Autowired
	 private ConcerService concerService;
	 
     public ConcerService getConcerService() {
		return concerService;
	}

	public void setConcerService(ConcerService concerService) {
		this.concerService = concerService;
	}

	/**
      * 添加关注的人
      * @param userid
      * @return
      */
	@RequestMapping(value="/addConcern.do",method=RequestMethod.POST)
	@ResponseBody
	public String addConcern(String userid,HttpServletRequest request){
		 User user=(User) request.getSession().getAttribute("user");
		   Concer c=new Concer();
		    c.setId(UUID.randomUUID().toString().substring(0, 10));
		    c.setUserByConcernerId(user);
		    int result = this.concerService.addConcer(c, userid);
		    String re="yes";
		     if(result==0){
		    	 re="no";
		     }
		  return re;
	}
}
