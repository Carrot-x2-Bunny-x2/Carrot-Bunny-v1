package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Comment;

/**
 * Servlet implementation class BoardCommentServlet
 */
@WebServlet("/board/comment")
public class BoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int refNum=Integer.parseInt(request.getParameter("refNum"));
		int commentLevel=Integer.parseInt(request.getParameter("commentLevel"));
		String commentContent=request.getParameter("commentContent");
		String commentWriter=request.getParameter("commentWriter");
		
		Comment c=new Comment();
		c.setBoardNumber(boardNum);
		c.setCommentLevel(commentLevel);
		c.setRefNumber(refNum);
		c.setCommentWriter(commentWriter);
		c.setCommentContent(commentContent);
		
	
		int result = new BoardService().insertComment(c);
		String msg="";
		String loc="/board/boardView?no="+boardNum;
		if(result>0) {
				//등록성공 
			msg="댓글등록 성공";
		}else {
			//등록실패 
			msg="댓글등록실패";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
