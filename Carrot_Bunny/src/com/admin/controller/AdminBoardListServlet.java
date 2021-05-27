package com.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class AdminBoardListServlet
 */
@WebServlet("/boardListPage")
public class AdminBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int cPage; //보고있는 현재 페이지
		int numPerPage; //페이지당 데이터수 -> 사용자가 설정한다. 
		
		//쿼리스트링으로 데이터를 넘겨도 된다. 
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) { 
			cPage=1;
		}
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=5;
		}

			
		// 사용자가 원하는 페이지를 호출할 수 있게 페이지바를 구성 ! 
		
		
		List<Board> list = new AdminService().selectBoardList(cPage, numPerPage); 
		request.setAttribute("list", list);
//		
//		for(Member m : list) {
//			System.out.println(m.getmemberNum());
//		}
		

		int totalData = new AdminService().selectBoardListCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);

		
		int pageBarSize = 4;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd= pageNo+pageBarSize-1;


		String pageBar="";


		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar +="<a href='"+request.getContextPath()
			+"/memberList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}

		
		while(!(pageNo>pageEnd||pageNo>totalPage)) { 
			if(cPage==pageNo) { //분기처리 
				pageBar+="<span style='background-color:orange;'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/boardListPage?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++; //1부터 while문이 돈다. 
		}

		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/memberList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar); //memberlist.jsp에 페이지바를 넘긴다. 

		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
