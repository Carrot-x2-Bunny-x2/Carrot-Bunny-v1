package com.board.controller;

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
@WebServlet("/board/boardLike")
public class BoardLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLike() {
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
		// 불러온 board에서 isLike에 저장된 userId를 ,를 기준으로 split해 가져옴.
		String[] likeList;
		if (board.getBoardLike() != null) {
			System.out.println("좋아요 목록 가져옴");
			likeList = board.getBoardLike().split(",");
		} else { //null일때는 아무것도 안넣어쥼 
			likeList = new String[0];
		}
		
		// 로그인 한 사용자의 아이디를 session으로 가져옴.
		String likeUserId = m.getUserId();
		
		// 사용자의 아이디가 likeList에 있는지 check ! 
		int check = 0;
		
		//likelist는 string 형, 문자열로 되어있음.
		//likelist에있는걸 하나씩 참조해서 들고오기. 
		//String str : likelist안에 있는건 string이다. 
		for (String str : likeList) {
			if (str.equals(likeUserId)) {
				System.out.println("일치 목록 있다아");
				check = 1; //일치목록있으면 1 
			}
		}
		int result = 0;
		// 사용자의 아이디를 isLike에 추가할지 결정! 
		
		//회색하트일때 빨간색 하트 만들때 
		if (check == 0) {
			System.out.println("찜 추가");
			//찜추가를 하면 처음에 초기화 된 리스트 길이를 늘려줘야 하기 때문에 설정하는것. 
	        int N = likeList.length;
	        //공간을 1을 늘려서 배열을 만들겠다. 배열복사해서 새로 배열을 만든다. 
	        likeList = Arrays.copyOf(likeList, N + 1);
	        //userid를 넣어준다. 
	        likeList[N] = likeUserId;
	        String resultList = String.join(",", likeList);
	        board.setBoardLike(resultList);
			result = new BoardService().updateLikeBoard(board);
		}
	
		//1일때 삭제 !빨간 하트를 누르면 삭제됨//
		if (check != 0) {
			System.out.println("찜 삭제");
			int index = 0;
			for (String str : likeList) {
				if (str.equals(likeUserId)) {
					likeList[index] = ""; //likelist일치하면 빈공간으로 만들어준다.
				}
				index += 1;
			}
			String resultList = String.join(",", likeList); //쉼표를 구분자로 넣어주겠당 
	        board.setBoardLike(resultList); 
	        System.out.println(resultList);
			result = new BoardService().updateLikeBoard(board);
		}
		
		
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
