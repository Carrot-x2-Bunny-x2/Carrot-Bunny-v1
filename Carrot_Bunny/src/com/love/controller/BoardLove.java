package com.love.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.member.model.vo.Member;

/**
 * Servlet implementation class BoardLike
 */
@WebServlet("/board/boardLove")
public class BoardLove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 이 서블릿은 찜을 눌렀을 때 실행된다.
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("loginMember");
		// 우선 no에 해당하는 board를 불러옴 .
		Board board = new BoardService().selectBoard(Integer.parseInt(request.getParameter("no")));
		
		
		int result = 0;
		
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "찜 설정 성공";
			loc = "/board/boardView?no="+board.getBoardNumber();
		} else {
			msg = "찜 설정 실패";
			loc = "/board/boardView?no="+board.getBoardNumber();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("board", board);
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
