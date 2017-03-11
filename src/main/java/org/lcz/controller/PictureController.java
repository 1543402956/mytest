package org.lcz.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lcz.entity.Picture;
import org.lcz.entity.User;
import org.lcz.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/picture")
public class PictureController {
	@Autowired
	private PictureService pictureService;
    
	@RequestMapping("/addPic.do")
	public String addFile(Picture pic,
			@RequestParam(value="filename",required=true)MultipartFile file,HttpServletRequest request){
		  //获取上传文件的所在路径
		  String realPath = request.getSession().getServletContext().getRealPath("img");
		   File f=new File(realPath,pic.getFname()+".jpg");
		   Date date=new Date();
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    if(!f.exists()){
		    	f.mkdirs();
		    }
		    try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      pic.setUrl(request.getContextPath()+"/img/"+pic.getFname()+".jpg");
		      User user=(User)request.getSession(true).getAttribute("user");
		      pic.setUser(user);
		      pic.setUploadTime(sdf.format(date));
		      pic.setClickNum(0);
		      int result = this.pictureService.addFile(pic);
		      if(result!=0){
		       return "redirect:/user/login.do";
		      }
		      return "error";
	}
    
	@RequestMapping(value="/findByFenye.do",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public List<Picture> findByFenye(String index,Model model){
		 int i = Integer.parseInt(index);
		 //List<Picture> list = this.pictureService.findPicById(userid, i);
		 List<Picture> list = this.pictureService.findPictures(i);
		 List<Picture> l=new ArrayList<Picture>();
		 if(list.size()!=0){
		 for(Picture p:list){
			  p.setUser(null);
			  l.add(p);
		 }
		 model.addAttribute("index",index);
		}
		 return l;
	}
	@RequestMapping(value="/findPicByname.do",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public Picture findPicByfname(String fname){
     Picture pic = this.pictureService.findPictureByfname(fname.trim());
       if(pic!=null){
        pic.getUser().setConcersForConcernedId(null);
        pic.getUser().setConcersForConcernerId(null);
        pic.setUser(null);
		 return pic;
		}
			return new Picture(null, null);
	}
	
	@RequestMapping(value="/findByUseridFenye.do",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public List<Picture> findByFenye(String userid,String index,Model model){
		 int i = Integer.parseInt(index);
		 List<Picture> list = this.pictureService.findPicById(userid, i);
		 List<Picture> l=new ArrayList<Picture>();
		 if(list.size()!=0){
		 for(Picture p:list){
			  p.setUser(null);
			  l.add(p);
		 }
		 model.addAttribute("index",index);
		}
		 return l;
	}
	  
	@RequestMapping(value="/findPicByuserIdAndfname.do",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public Picture findPicByuserIdAndfname(String fname,HttpServletRequest request){
		 User u=(User) request.getSession().getAttribute("user");
     Picture pic = this.pictureService.findPicByuserIdAndfname(fname,u.getId());
       if(pic!=null){
        pic.getUser().setConcersForConcernedId(null);
        pic.getUser().setConcersForConcernerId(null);
        pic.setUser(null);
		 return pic;
		}
		return new Picture(null, null);
	}
	
	@RequestMapping(value="/findAllUsersPic.do")
	public String getUsersPic(String fname,HttpServletRequest request){
		 User u=(User) request.getSession().getAttribute("user");
		 List<Picture> list2 = this.pictureService.findPicById(u.getId(), 1);
           request.getSession().setAttribute("list2", list2);
		   return "userInfo";
	}
	@RequestMapping("/{pictureid}/delete.do")
	  public String deletePicture(@PathVariable(value="pictureid")String id,HttpServletRequest request){
		   int result=this.pictureService.deletePicById(id);
		   if(result==0){
			   return "error";
		   }
		   User u=(User) request.getSession().getAttribute("user");
			 List<Picture> list2 = this.pictureService.findPicById(u.getId(), 1);
	           request.getSession().setAttribute("list2", list2);
		  return "userInfo";
	  }
	public PictureService getPictureService() {
		return pictureService;
	}

	public void setPictureService(PictureService pictureService) {
		this.pictureService = pictureService;
	}
	
}
