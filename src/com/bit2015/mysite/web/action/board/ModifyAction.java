package com.bit2015.mysite.web.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit2015.mysite.dao.BoardDao;
import com.bit2015.mysite.vo.BoardVo;
import com.bit2015.web.WebUtil;
import com.bit2015.web.action.Action;

public class ModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BoardVo vo = new BoardVo();
		BoardDao dao = new BoardDao();
		Long no = Long.parseLong(request.getParameter("bno"));
		
		vo=dao.select(no);
		
		request.setAttribute("modify", vo);
		WebUtil.forwarding(request,response,"/views/board/modify.jsp");
		
	}

}
