package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		//게시물 등록하기 위한 클래스
		BoardBean boardBean = null;
		String realFolder = "";
		//String saveFolder = "/boardUpload";
		//업로드하는 파일 크기(5M)
		int fileSize = 5*1024*1024;
		//ServletContext context = request.getServletContext();
		//realFolder = context.getRealPath(saveFolder);
		//첨부파일이 업로드되는 위치
		realFolder = "D:\\jspStudy\\ashop\\src\\main\\webapp\\resources\\img\\board";
		
		//파일을 업로드 하기 위해서 사용하는 클래스
		//cos.jar파일 필요
		MultipartRequest multi = new MultipartRequest(
									request,//내장객체
									realFolder,//업로드위치
									fileSize,//파일크기
									"utf-8",//인코딩방식
									//동일한 파일을 업로드시 넘버링 처리
									new DefaultFileRenamePolicy()
								);
		
		//테이블 board에 입력받은 데이터를 추가하기 위해서 인스턴스 생성
		boardBean = new BoardBean();
		
		boardBean.setBOARD_NAME(multi.getParameter("board_name"));
		boardBean.setBOARD_PASS(multi.getParameter("board_pass"));
		boardBean.setBOARD_SUBJECT(multi.getParameter("board_subject"));
		boardBean.setBOARD_CONTENT(multi.getParameter("board_content"));
		boardBean.setBOARD_FILE(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		//신규 게시물을 처리하기 위한 서비스 클래스
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		//신규 게시물 등록처리하는 메서드
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('신규 게시물 등록 실패');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			//신규 게시물등록이 정상처리되면 
			//게시물 리스트를 보여준다.
			forward = new ActionForward();
			//response.sendRedirect()를 수행
			forward.setRedirect(true);
			forward.setPath("boardList.bo");
		}

		return forward;
	}

	
}
