package com.bit2015.mysite.web.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit2015.mysite.dao.BoardDao;
import com.bit2015.mysite.vo.BoardVo;
import com.bit2015.web.WebUtil;
import com.bit2015.web.action.Action;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String message = request.getParameter("content");
		Long bno = Long.parseLong(request.getParameter("bno"));
		
		BoardVo vo  = new BoardVo();
		vo.setTitle(title);
		vo.setContent(message);
		vo.setNo(bno);
		BoardDao dao = new BoardDao();
		dao.update(vo);
		
		WebUtil.redirect(response, "/mysite/board");
		

	}

}
