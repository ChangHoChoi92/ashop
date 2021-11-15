package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//ArrayList & Array 차이점
		//Array(배열)은 한번 크기를 지정하고 나면 크기변경을 할수 없다.
		//ArrayList는 배열형태로 계속 데이터를 추가
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		
		int page = 1;//현재 페이지
		int limit = 10;//현재 페이지에 보여지는 리스트 갯수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));   
		}
		
		BoardListService boardListService = new BoardListService();
		//게시물 총건수
		int listCount = boardListService.getListCount();
		
		//현재 페이지에 해당하는 게시물 목록을 가져오는 메서드
		articleList = boardListService.getArticleList(page,limit);
		
		//페이징 처리
		//게시물 갯수가 만약에 130개 이면 13Page 필요
		//게시물 갯수가 만약에 123개 이면 13Page 필요
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+9;
		
		//계산된 마지막 페이지 maxPage보다 크면
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//페이징 처리를 하기 위한 클래스에 데이터 대입
		PageInfo pageInfo = new PageInfo();
		
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		//속성 지정
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("articleList",articleList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/board/qna_board_list.jsp");
		
		return forward;
		
	}

}




