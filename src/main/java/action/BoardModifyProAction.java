package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

//특정 게시물 수정 처리를 하는 클래스
public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		boolean isModifySuccess = false;
		//수정하려는 게시물 번호
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");
		
		BoardBean article = new BoardBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		
		//특정 게시물을 수정할때 게시물등록시 입력했던 비밀번호를
		//체크하는 메서드(isArticleWriter)
		boolean isRightUser = boardModifyProService.
				isArticleWriter(board_num,request.getParameter("board_pass"));
		
		if(!isRightUser) {//게시물 비밀번호 틀린 경우
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {//게시물 비밀번호 맞는 경우
			article.setBOARD_NUM(board_num);//특정게시물 번호
			//수정할 제목
			article.setBOARD_SUBJECT(request.getParameter("board_subject"));
			//수정할 내용
			article.setBOARD_CONTENT(request.getParameter("board_content"));
			
			//modifyArticle 메서드에서 특정 게시물 내용을 수정처리
			isModifySuccess = 
				boardModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('게시물 수정 실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num=" + article.getBOARD_NUM() + "&page=" + nowPage);
				
			}
		}
		
		return forward;
		
	}
}
