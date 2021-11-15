package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardFrontController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	
    	//주소uri에서 프로젝트명부터 끝까지 문자열을 가져온다
    	String RequestURI = request.getRequestURI();
    	//주소uri에서 프로젝트명만 가져옴
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	ActionForward forward = null;
    	Action action = null;
    	
    	//신규 게시물 등록을 위한 화면 실행
    	if(command.equals("/boardWriteForm.bo")) {
    		forward = new ActionForward();
    		forward.setPath("/board/qna_board_write.jsp");
    	}else if(command.equals("/boardWritePro.bo")) {
    		
    		//신규 게시물 등록 처리
    		action = new BoardWriteProAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardList.bo")) {
    		//게시물 리스트
    		action = new BoardListAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardDetail.bo")) {
    		//특정 게시물 상세보기 처리
    		
    		//2021.08.31 수정
    		String nowPage = request.getParameter("page");
    		request.setAttribute("page", nowPage);
    		
    		
    		action = new BoardDetailAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardReplyForm.bo")) {
    		//특정게시물에 대한 댓글 입력 폼
    		action = new BoardReplyFormAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardReplyPro.bo")) {
    		//댓글입력 처리
    		action = new BoardReplyProAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardModifyForm.bo")) {
    		//특정 게시물 수정 화면 폼
    		action = new BoardModifyFormAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardModifyPro.bo")) {
    		//특정 게시물 수정 처리
    		action = new BoardModifyProAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(command.equals("/boardDeleteForm.bo")) {
    		//특정 게시물 삭제를 위한 폼
    		String nowPage = request.getParameter("page");
    		request.setAttribute("page",nowPage);
    		int board_num = Integer.parseInt(request.getParameter("board_num"));
    
    		request.setAttribute("board_num",board_num);
    		forward = new ActionForward();
    		forward.setPath("/board/qna_board_delete.jsp");
    	}else if(command.equals("/boardDeletePro.bo")) {
    		//특정 게시물 삭제 처리
    		action = new BoardDeleteProAction();
    		try {
    			forward = action.execute(request,response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	
    	//forward 할게 있으면
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			//강제로 특정 uri로 이동
    			response.sendRedirect(forward.getPath());
    		}else {
    			//forward방식은 A.JSP -> B.JSP로 제어권은 넘어가지만
    			//A.JSP에서 입력받은 값은 B.JSP에서 유효
    			RequestDispatcher dispatcher = 
    					request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request,response);
    		}
    	}
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
