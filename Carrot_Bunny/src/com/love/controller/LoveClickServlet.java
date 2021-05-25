package com.love.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.love.model.service.LoveService;
import com.love.model.vo.Love;
import com.member.model.vo.Member;

/**
 * Servlet implementation class BoardLike
 */
@WebServlet("/love/loveClick")
public class LoveClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoveClickServlet() {
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
		
		int boardNumber = Integer.parseInt(request.getParameter("no"));
		int cnt = new LoveService().findLove(m, boardNumber);
		
		Love updateLove = new Love();
		updateLove.setBoardNumber(boardNumber);
		updateLove.setUserId(m.getUserId());
		int result = -1;
		
		if (cnt == 0) {
			// insert는 성공시 정수 반환하는 듯
			result = new LoveService().insertLove(updateLove);
			System.out.println("삽입");
		} else {
			// delete는 성공시 삭제한 row수 반환
			result = new LoveService().deleteLove(updateLove);
			System.out.println("삭제");
		}
		
		String msg = "";
		String loc = "/board/boardView?no="+boardNumber;
		if (result > 0) {
			msg = "찜 설정 성공";
		} else {
			msg = "찜 설정 실패";
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
