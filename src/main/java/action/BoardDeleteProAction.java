package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		//삭제하려는 특정 게시물 번호
		int board_num = 
			Integer.parseInt(request.getParameter("board_num"));
		//현재 페이지 번호
		String nowPage = request.getParameter("page");

		BoardDeleteProService boardDeleteProService = new
				BoardDeleteProService();
		//특정 게시물을 삭제할때 게시물등록시 입력했던 비밀번호를
		//체크하는 메서드(isArticleWriter)
		boolean isArticleWriter = 
				boardDeleteProService.isArticleWriter(board_num,request.getParameter("board_pass"));
		
		if(!isArticleWriter) {//게시물 비밀번호 틀린 경우
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {//게시물 비밀번호 맞는 경우
			boolean isDeleteSuccess =
				//특정 게시물을 삭제처리		
				boardDeleteProService.removeArticle(board_num);
			
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('게시물 삭제 실패');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				//정상적으로 게시물 삭제되면 현재페이지의 게시물리스트로
				//이동
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + nowPage);
			}
		}
		
		return forward;

	}

}
