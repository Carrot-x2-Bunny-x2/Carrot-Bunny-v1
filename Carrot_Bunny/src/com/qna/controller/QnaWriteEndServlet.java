package com.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.qna.model.service.QnaService;
import com.qna.model.vo.Qna;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/qna/qnaWriteEnd")
public class QnaWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userId = loginMember.getUserId();
		
		String qnaTitle=request.getParameter("qnaTitle");
		String qnaContent=request.getParameter("qnaContent");

		System.out.println("이름 : " + userId + "제목 : " + qnaTitle + "내용 : " + qnaContent);	
		
		Qna q = new Qna();
		
		q.setQnaTitle(qnaTitle);
		q.setQnaWriter(userId);
		q.setQnaContent(qnaContent);
		
		int result = new QnaService().insertQna(q);
		
		String msg=result>0?"1:1 문의 등록 완료":"1:1 문의 답변 등록 실패";
		//String loc="/";
		//수정페이지로 이동해보자
		String loc="/qna.do";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
