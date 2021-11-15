package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

//특정 게시물 삭제처리를 하는 서비스 클래스
public class BoardDeleteProService {

	//사용자가 특정 게시물을 삭제할 권한이 있는지 체크
		public boolean isArticleWriter(int board_num,String pass) {
			boolean isArticleWriter = false;
			Connection con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con);
			
			isArticleWriter = boardDAO.isArticleBoardWriter(board_num,pass);
			
			close(con);
			
			return isArticleWriter;
		}
		
		//특정 게시물 삭제처리
		public boolean removeArticle(int board_num) {
			boolean isRemoveSuccess = false;
			Connection con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con);

			//특정 게시물 삭제처리
			int deleteCount = boardDAO.deleteArticle(board_num);
			
			if(deleteCount > 0) {
				commit(con);
				isRemoveSuccess = true;
			}else {
				rollback(con);
			}
			
			close(con);
			
			return isRemoveSuccess;
		}
}
