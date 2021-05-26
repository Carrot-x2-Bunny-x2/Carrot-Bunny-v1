package com.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.member.model.vo.Member;
import com.qna.model.service.QnaService;
import com.qna.model.vo.Qna;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/qna.do")
public class QnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (session == null || loginMember == null) {
			request.setAttribute("msg", "로그인 후 이용할 수 있습니다.");
			request.setAttribute("loc", "/index.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
		} else {
			
			String userId = loginMember.getUserId();

			System.out.println("id가져오는지 테스트");
			System.out.println(userId);
			List<Qna> list = null;
			String admin = "admin";

			if (userId.equals(admin)) {
				System.out.println("관리자가 보는 1:1");
				list = new QnaService().QnaList();
			} else {
				System.out.println("문의 작성자가 보는 1:1");
				list = new QnaService().QnaListUser(userId);
			}

			System.out.println("List 받았는지 테스트");
			System.out.println(list.toString());

			request.setAttribute("qna", list);

			request.getRequestDispatcher("/views/qna/qna.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
