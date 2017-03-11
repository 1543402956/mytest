package org.lcz.test;

import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.lcz.dao.impl.UserDaoImpl;
import org.lcz.entity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
	private ApplicationContext ac=null;
  
	 @Test
	public void test1(){
		 UUID randomUUID = UUID.randomUUID();
		  String id = randomUUID.toString();
		  System.out.println(id);
	}
	 @Before
	 public void befor(){
		 ac=new ClassPathXmlApplicationContext("spring.xml");
		 System.out.println(ac);
	 }
	 
	 public void test2(){
		 System.out.println(ac);
		 UserDaoImpl u=ac.getBean("userDaoImpl",UserDaoImpl.class);
		  User user=new User();
		   user.setName("luyang");
		   user.setUsername("luyang");
		   user.setGender("男");
		   user.setPassword("luyang");
		   int i=u.insertUser(user);
		   System.out.println(i);
	 }
}
