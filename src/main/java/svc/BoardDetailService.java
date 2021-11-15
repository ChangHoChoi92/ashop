package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

//특정 게시물 상세보기 요청을 처리하는 서비스 클래스
public class BoardDetailService {

	//특정 게시물 상세보기처리
	public BoardBean getArticle(int board_num) {
		
		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		//게시물을 클릭시 조회수를 1증가 시켜주는 메서드 실행
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		//특정 게시물에 대한 내역을 가져와서 article에 대입
		article = boardDAO.selectArticle(board_num);
		
		close(con);
		
		return article;
	}
	
}





