package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/board/boardSearch")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		int numPerPage;
		// 데이터를 가져올때 원하는 구역 가져오기
		// 1. 사용자가 원하는 page -> 현재 페이지
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		// 2. 페이지당 데이터 수 -> 사용자가 설정
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=10;
		}
		String[] soldCheck;
		int sold;
		
		try {
			soldCheck = request.getParameterValues("soldCheck");
			
		}catch(NumberFormatException e) {
			soldCheck = null;
		}
		if (soldCheck != null) {
			sold = 1;
		} else {
			try {
				sold = Integer.parseInt(request.getParameter("sold"));
				
			} catch(NumberFormatException e) {
				sold = 0;
			}
		}
		String searchType=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		
		List<Board> list;
		int totalData;
		// sold==1 일 때 판매완료된 상품까지 검색 아니면 판매중인 상품만 검색
		if (sold == 1) {
			list=new BoardService().searchBoardList(cPage, numPerPage, searchType, keyword);
			totalData=new BoardService().searchBoardCount(searchType, keyword);
		} else {
			list=new BoardService().searchSoldBoardList(cPage, numPerPage, searchType, keyword);
			totalData=new BoardService().searchSoldBoardCount(searchType, keyword);
		}
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+(pageNo-1)
					+"&numPerpage="+numPerPage
					+"&searchType="+searchType+"&searchKeyword="+keyword+"&sold="+sold+"'>[이전]</a>";
		}
	
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+pageNo
						+"&numPerpage="+numPerPage
						+"&searchType="+searchType+"&searchKeyword="+keyword+"&sold="+sold+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+pageNo
					+"&numPerpage="+numPerPage
					+"&searchType="+searchType+"&searchKeyword="+keyword+"&sold="+sold+"'>[다음]</a>";
		}
		// pageBar에는 결국 [이전], 페이지 숫자들, [다음]과 관련된 html 문자열이 들어감
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("cPage",cPage);
		System.out.println("여기서 sold는"+sold);
		request.setAttribute("sold",sold);

		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/boardPage.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
