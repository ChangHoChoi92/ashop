package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

//댓글 입력 폼 요청을 위한 클래스
public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		//댓글 입력 처리후에 작업중인 페이지로 다시 되돌아가기 위한
		//현재 페이지 번호
		String nowPage = request.getParameter("page");
		//댓글을 입력하기 위한 특정 게시물 번호
		int board_num = 
			Integer.parseInt(request.getParameter("board_num"));

		//게시물 상세보기를 처리하기 위한 서비스 객체를
		//이용하여 댓글처리를 하기위해 게시물 정보를
		//article에 대입
		BoardDetailService boardDetailService = new
				BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		
		request.setAttribute("article",article);
		request.setAttribute("page",nowPage);
		
		//댓글 입력화면으로 이동
		forward.setPath("/board/qna_board_reply.jsp");
		
		return forward;
			
	}

}




