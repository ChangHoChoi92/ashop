package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;

//특정 게시물에 대한 댓글등록 처리를 하는 클래스
public class BoardReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		//현재페이지
		String nowPage = request.getParameter("page");
		//댓글등록을 위한 인스턴스 생성
		BoardBean article = new BoardBean();
		
		article.setBOARD_NUM(Integer.parseInt(request.getParameter("board_num")));
		article.setBOARD_NAME(request.getParameter("board_name"));
		article.setBOARD_PASS(request.getParameter("board_pass"));
		article.setBOARD_SUBJECT(request.getParameter("board_subject"));
		article.setBOARD_CONTENT(request.getParameter("board_content"));
		article.setBOARD_RE_REF(Integer.parseInt(request.getParameter("board_re_ref")));
		article.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("board_re_lev")));
		article.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("board_re_seq")));
		
		BoardReplyProService boardReplyProService = 
				new BoardReplyProService();
		boolean isReplySuccess = 
				//특정 게시물에 대한 댓글처리를 수행
				boardReplyProService.replyArticle(article);

		if(isReplySuccess) {//댓글등록처리가 성공하면
			forward = new ActionForward();
			forward.setRedirect(true);
			//원래 작업중인 게시물리스트 페이지로 이동
			forward.setPath("boardList.bo?page=" + nowPage);
		}else {//댓글입력처리 실패하면
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 등록 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}