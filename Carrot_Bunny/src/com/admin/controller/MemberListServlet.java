package com.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.service.AdminService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		Member loginMember=(Member)session.getAttribute("loginMember");
		if(session == null || loginMember == null||!loginMember.getUserId().equals("admin")) {
			//잘못된 경로로 접근하셨습니다. ㅇㅣ페이지의 사용권한이 없습니다 -> 에러메세지 띄워주고 메인화면으로 돌아가게 
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다. 이 페이지 사용권한이 없습니다!!!!돌아가");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
			
		}else { 
		
		//현재 페이지
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage =1;
		}
		
		//페이지당 데이터수 설정 
		int numPerPage;
		try {
			numPerPage =Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerPage = 10;
		}
		
		List<Member> list = new AdminService().selectMemberList(cPage, numPerPage);
		request.setAttribute("list", list);
		
		int totalData = new AdminService().selectMemberCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize = 10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd= pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
			+"/memberList?cPage="+pageNo+"'>"+pageNo+"</a>";
		}
		pageNo++;
	
	
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/memberList?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("views/admin/memberLisg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
