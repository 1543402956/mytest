package org.lcz.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lcz.entity.Concer;
import org.lcz.entity.Picture;
import org.lcz.entity.User;
import org.lcz.service.ConcerService;
import org.lcz.service.PictureService;
import org.lcz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/user")
public class UserContoller {
   @Autowired
	private UserService userService;
   @Autowired
	private PictureService pictureService;
   @Autowired
    private ConcerService concerService;
   @RequestMapping("/addUser.do")
   public String addUser(User user){
	    Date date=new Date();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   user.setRegistTime(sdf.format(date));
	   user.setType("普通用户");
	   user.setStatus(1);
	  int result = this.userService.addUser(user);
	  if(result!=0){
		  return "redirect:/login.jsp";
	  }
	  return "error";
   }
  
   @RequestMapping("/login.do") 
   public String userLogin(String username,String password,HttpServletRequest request,Model model){
	     User user = this.userService.login(username, password);	
        if(user!=null){
 	   request.getSession().setAttribute("user", user);
 	   List<Picture> list = this.pictureService.findPictures(1);
          model.addAttribute("list", list);
 	    return "home";
 	   }
        if((User)request.getSession().getAttribute("user")!=null){
        	 user=(User)request.getSession().getAttribute("user");
        	// List<Picture> list=this.pictureService.findPicById(user.getId(),1);
        	 List<Picture> list = this.pictureService.findPictures(1);
             model.addAttribute("list", list);
        	return "home";
        }
      request.getSession().setAttribute("msg","用户名或密码错误");
	  return "redirect:/login.jsp";
   }
   
   @RequestMapping("/logOut.do")
   public String userLogOut(HttpServletRequest request){
	     request.getSession().invalidate();
	   return "redirect:/login.jsp";
   }
   @RequestMapping("/editUser.do")
   public String editUser(User user,HttpServletRequest request){
	     User u = (User) request.getSession().getAttribute("user");
	      u.setUsername(user.getUsername());
	      u.setProvince(user.getProvince());
	      u.setCity(user.getCity());
	      u.setEmail(user.getEmail());
	      u.setMobile(user.getMobile());
	      u.setQq(user.getQq());
	  int result = this.userService.modifyUser(u);
	   if(result!=0){
		   request.getSession().setAttribute("user", u);  
		   return "home";
	   }
	  return "error";
   }
    @RequestMapping("/forwardMyself.do")
   public String forwardMyself(HttpServletRequest request){
	     User  user = (User) request.getSession().getAttribute("user");
    	   String id = user.getId();
    	   List<Picture> list2=this.pictureService.findPicById(user.getId(),1);
    	   List<Concer> l = this.concerService.getConceredByid(id);//查询我关注的人
    	   List<Concer> conedList=this.concerService.getConcerByid(id);//查询关注我的人
    	    int size = l.size();
    	    int size2 = conedList.size();
    	    request.getSession().setAttribute("list2", list2);
    	    request.getSession().setAttribute("conceredUsered", conedList);
     	   request.getSession().setAttribute("size2", size2);
    	   request.getSession().setAttribute("conceredUser", l);
    	   request.getSession().setAttribute("size", size);
	      return "userInfo";
   }
   @RequestMapping("/eidtPwd.do")
   public String eidtUserPwd(String password,@RequestParam(value="newPwd")String newPassword,
		    HttpServletRequest request){
	          User user=(User) request.getSession().getAttribute("user");
	           if(password.equals(user.getPassword())){
	        	   user.setPassword(newPassword);
	        	 this.userService.modifyUser(user);
	        	 request.getSession().removeAttribute("user");
	        	  return "redirect:/login.jsp";
	           }
	   return "error";
   }
    
   @RequestMapping("/editSig.do")
   public String editUserSig(String intro,HttpServletRequest request){
	       User user=(User) request.getSession().getAttribute("user");
	         user.setIntro(intro);
	         this.userService.modifyUser(user);
	         request.getSession().setAttribute("user", user);
	   return "redirect:/userInfo.jsp";
   }
   
   @RequestMapping(value="/editHead.do",method=RequestMethod.POST)
   @ResponseBody
   public String editHead(@RequestParam(value="fname",required=false)CommonsMultipartFile fname,HttpServletRequest request){
	   String realPath = request.getSession().getServletContext().getRealPath("myimg");
	    User u=(User) request.getSession().getAttribute("user");
	    File file=new File(realPath,u.getId()+".jpg");
	    try {
			fname.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	   return "yes";
   }
   
   @RequestMapping(value="/findByFenye.do",method=RequestMethod.POST)
   @ResponseBody
   public List<User> findByFenye(@RequestParam("userid")String id,String index){
	     List<User> list=this.userService.findUserByFenye(id,index);
	     List<User> l=this.userService.findUserByFenye(id,index);
	     for(User u:list){
	    	   u.setConcersForConcernedId(null);
	    	   u.setConcersForConcernerId(null);
	    	   u.setPictures(null);
	     }
	     return l;
   }
    
   @RequestMapping("/cancelAtt.do")
   @ResponseBody
   public String cancelAttention(String id,HttpServletRequest request){
	     User u = (User) request.getSession().getAttribute("user");
	     int result = this.concerService.deleteByConcerned_id(id,u.getId());
	     if(result>0){
	    return "yes";
	   }
	     return "no";
   }
   
   
   
   
   
   
public UserService getUserService() {
	return userService;
}
public void setUserService(UserService userService) {
	this.userService = userService;
}

public PictureService getPictureService() {
	return pictureService;
}

public void setPictureService(PictureService pictureService) {
	this.pictureService = pictureService;
}

public ConcerService getConcerService() {
	return concerService;
}

public void setConcerService(ConcerService concerService) {
	this.concerService = concerService;
}
 @RequestMapping("/Mytest.do")
 @ResponseBody
   public String getTest(){
	   
	 return "yse";
   }
}
