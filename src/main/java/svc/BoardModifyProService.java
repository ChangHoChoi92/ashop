package svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

//특정 게시물 수정처리를 하기 위한 서비스 클래스
public class BoardModifyProService {

	//사용자가 특정 게시물을 수정할 권한이 있는지 체크
	public boolean isArticleWriter(int board_num,String pass) {
		boolean isArticleWriter = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num,pass);
		
		close(conn);
		
		return isArticleWriter;
	}
	
	//특정 게시물 수정처리
	public boolean modifyArticle(BoardBean article) {
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		//특정 게시판 수정 처리
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0) {
			commit(conn);
			isModifySuccess = true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return isModifySuccess;
	}
}
