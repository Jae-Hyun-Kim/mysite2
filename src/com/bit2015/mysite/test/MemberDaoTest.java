package com.bit2015.mysite.test;

import com.bit2015.mysite.dao.MemberDao;
import com.bit2015.mysite.vo.MemberVo;

public class MemberDaoTest {
	
	public static void main(String[] args){
		//insertTest();
		
		updateTest();
		getTest();
	
		
	}
	
	public static void insertTest(){
		MemberDao dao = new MemberDao();
		
		MemberVo vo  = new MemberVo();
		vo.setName("홍길동");
		vo.setEmail("gildong@gmail.com");
		vo.setPassword("1234");
		vo.setGender("male");
		
		dao.insert(vo);
	}
	
	public static void getTest(){
		MemberDao dao = new MemberDao();
		MemberVo vo = dao.get("gildong@gmail.com", "1234");
		System.out.println(vo);
	}
	
	public static void updateTest(){
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
	
		vo.setName("홍길동111");
		
		vo.setEmail("gildong@gmail.com");
		vo.setPassword("1234");
		vo.setGender("female");
		vo.setNo(2L);
		
		dao.update(vo);
	}
}
