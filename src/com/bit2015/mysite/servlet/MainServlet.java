package com.bit2015.mysite.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit2015.mysite.web.action.main.MainActionFactory;
import com.bit2015.web.action.Action;
import com.bit2015.web.action.ActionFactory;


@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);  //두갯 두포스트 둘다 한번에 처리할라고 이러는거야 
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String actionName = request.getParameter("a"); // ?a= 
		
		ActionFactory af = new MainActionFactory();
		
		Action action = af.getAction(actionName);
		action.execute(request, response);
	}

}
