package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

//게시물 리스트를 보여주는 서비스 클래스
public class BoardListService {

	public int getListCount() {
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDAO.setConnection(con);
		
		//게시물 총건수
		listCount = boardDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<BoardBean> getArticleList(int page,int limit){
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDAO.setConnection(con);
		
		articleList = boardDAO.selectArticleList(page,limit);
		close(con);

		return articleList;
	}
}
