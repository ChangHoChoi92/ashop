package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

//특정 게시물 상세보기 처리하는 클래스
public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//특정 게시물 번호
		int board_num = 
			Integer.parseInt(request.getParameter("board_num"));
		//현재 페이지
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		//특정 게시물 상세보기를 실행하는 메서드
		BoardBean article = boardDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		
		//현재 페이지
		request.setAttribute("page",page);
		//특정 게시물 상세내역
		request.setAttribute("article",article);
		
		//특정 게시물 상세보기를 처리하는 JSP로 이동
		forward.setPath("/board/qna_board_view.jsp");
		
		return forward;
		
	}

}





