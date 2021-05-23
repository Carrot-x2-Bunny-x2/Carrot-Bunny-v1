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
		// 우선 no에 해당하는 board를 불러옵니다.
		Board board = new BoardService().selectBoard(Integer.parseInt(request.getParameter("no")));
		// 불러온 board에서 isLike에 저장된 userId를 ,를 기준으로 split해 가져옵니다.
		String[] likeList;
		if (board.getBoardLike() != null) {
			System.out.println("좋아요 목록 가져옴");
			likeList = board.getBoardLike().split(",");
		} else {
			likeList = new String[0];
		}
		// 로그인 한 사용자의 아이디를 session으로 가져옵니다.
		String likeUserId = m.getUserId();
		// 사용자의 아이디가 likeList에 있는지 check합니다.
		int check = 0;
		
		for (String str : likeList) {
			if (str.equals(likeUserId)) {
				System.out.println("일치 목록 있음");
				check = 1;
			}
		}
		int result = 0;
		// 사용자의 아이디를 isLike에 추가할지 결정합니다.
		if (check == 0) {
			System.out.println("찜 추가");
			//Steps to add a new element
	        //Get the current length of the array
	        int N = likeList.length;
	        //Create a new array of length N+1 and copy all the previous elements to this new array
	        likeList = Arrays.copyOf(likeList, N + 1);
	        //Add a new element to the array
	        likeList[N] = likeUserId;
	        String resultList = String.join(",", likeList);
	        board.setBoardLike(resultList);
			result = new BoardService().updateLikeBoard(board);
		}
	
		if (check != 0) {
			System.out.println("찜 삭제");
			int index = 0;
			for (String str : likeList) {
				if (str.equals(likeUserId)) {
					likeList[index] = "";
				}
				index += 1;
			}
			String resultList = String.join(",", likeList);
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
