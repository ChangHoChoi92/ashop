package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import javax.sql.DataSource;

import vo.BoardBean;

//게시판 테이블 board와 연동하는 클래스
public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;
	
	public BoardDAO() {}
	
	//싱글톤 패턴 사용
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		
		return boardDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//게시물 총건수
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//게시물 총건수 구하기
			pstmt = con.prepareStatement(
					"select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("selectListCount() 에러:" + e);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	//게시물 총 리스트를 조회하는 메서드
	//page :현재페이지,limit : 한 페이지에 보여지는 리스트 갯수
	public ArrayList<BoardBean> selectArticleList(
									int page,int limit){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = 
				"select * from board" +
		        " order by board_num desc limit ?,10";
		
		//조회된 게시물 리스트를 저장하기 위한 ArrayList 선언
		ArrayList<BoardBean> articleList = 
				new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = (page-1)*10;
		
		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1,startrow);
			
			//조회된 전체 게시물 리스트를 ResultSet에 대입
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				board = new BoardBean();
				
				//BoardBean 클래스 형태의 참조변수 board에 대입
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_NAME(rs.getString("board_name"));
				board.setBOARD_SUBJECT(rs.getString("board_subject"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_readcount"));
				board.setBOARD_DATE(rs.getDate("board_date"));
				
				//board 내용을 ArrayList에 추가 처리
				articleList.add(board);
				
			}
		}catch(Exception e) {
			System.out.println("getBoardList() 에러:" + e);
		}finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}
	
	//특정 게시물 정보 가져오기를 수행하는 메서드
	public BoardBean selectArticle(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		
		try {
			//특정 게시물에 대한 정보를 가져오기 위해
			//게시물 번호 적용
			pstmt = con.prepareStatement(
				"select * from board where board_num = ?");
			pstmt.setInt(1,board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardBean = new BoardBean();
				
				boardBean.setBOARD_NUM(rs.getInt("board_num"));
				boardBean.setBOARD_NAME(rs.getString("board_name"));
				boardBean.setBOARD_SUBJECT(rs.getString("board_subject"));
				boardBean.setBOARD_CONTENT(rs.getString("board_content"));
				boardBean.setBOARD_FILE(rs.getString("board_file"));
				boardBean.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				boardBean.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				boardBean.setBOARD_READCOUNT(rs.getInt("board_readcount"));
				boardBean.setBOARD_DATE(rs.getDate("board_date"));
			}
		}catch(Exception e) {
			System.out.println("getDetail() 에러:" + e);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardBean;
	}
	
	//신규 게시물 등록처리를 하는 메서드
	public int insertArticle(BoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			//신규 게시물 등록처리를 하기 위해서 board
			//테이블에 마지막 게시물 번호를 가져오기
			pstmt = con.prepareStatement(
				"select ifnull(max(board_num),1) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//신규 게시물 번호를 적용하기 위해 +1 을 한다.
				num = rs.getInt(1) + 1;
			}else {
				//board 테이블에 자료가 한건도 없는 경우
				//신규 게시물 번호는 1번으로 처리
				num = 1;
			}
				//now():시스템 일자
				//오라클:sysdate하고 동일
			sql = "insert into board" + 
			      " values(?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,num);//게시물번호
			pstmt.setString(2,article.getBOARD_NAME());//작성자
			pstmt.setString(3,article.getBOARD_PASS());//비밀번호
			pstmt.setString(4,article.getBOARD_SUBJECT());//제목
			pstmt.setString(5,article.getBOARD_CONTENT());//내용
			pstmt.setString(6,article.getBOARD_FILE());//첨부파일
			pstmt.setInt(7,num);//댓글번호
			pstmt.setInt(8,0);//댓글레벨 초기화
			pstmt.setInt(9,0);//댓글순번 초기화
			pstmt.setInt(10,0);//조회수 초기화
			
			insertCount = pstmt.executeUpdate();

		}catch(Exception e) {
			System.out.println("boardInsert() 에러:" + e);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	//신규 댓글 등록처리를 하는 메서드
	public int insertReplyArticle(BoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql = "select max(board_num) from board";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref = article.getBOARD_RE_REF();//댓글번호를 가져온다
		int re_lev = article.getBOARD_RE_LEV();//댓글레벨을 가져온다
		int re_seq = article.getBOARD_RE_SEQ();//댓글일련번호를 가져온다
		
		
		try {
			
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}else {
				num = 1;
			}
			
			//현재 댓글보다 이전에 등록된 댓글 일련번호(board_re_seq)를
			//현재 댓글보다 아래에 표시하기 위해 댓글 일련번호를 1씩 증가시킴
			sql = "update board" + 
			      "   set board_re_seq = board_re_seq + 1" +
				  " where board_re_ref = ? and board_re_seq > ?";	
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,re_ref); //댓글번호
			pstmt.setInt(2,re_seq); //댓글일련번호
			
			int updateCount = pstmt.executeUpdate();
			
			//update 문장이 정상적으로 처리되면 commit 처리
			if(updateCount > 0) {
				commit(con);
			}
			
			re_seq = re_seq + 1;//댓글일련번호를 1 증가
			re_lev = re_lev + 1;//게시판에 대한 댓글을 표시하기 위해 레벨 지정 
			
			sql = "insert into board" + 
			      "      values(?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,num);
			pstmt.setString(2,article.getBOARD_NAME());
			pstmt.setString(3,article.getBOARD_PASS());
			pstmt.setString(4,article.getBOARD_SUBJECT());
			pstmt.setString(5,article.getBOARD_CONTENT());
			//신구 댓글처리시 첨부파일은 변경하지 않는다.
			pstmt.setString(6,"");
			pstmt.setInt(7,re_ref);//댓글번호
			pstmt.setInt(8,re_lev);//댓글레벨
			pstmt.setInt(9,re_seq);//댓글일련번호
			pstmt.setInt(10,0);//조회수

			insertCount = pstmt.executeUpdate();
			
		}catch(SQLException ex) {
			System.out.println("boardReply() 에러:" + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	//특정 게시물 수정처리를 하는 메서드
	//특정 게시물 수정시 모든 항목을 받기위해 BoardBean형태로 매개변수
	//를 받는다.
	public int updateArticle(BoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		//특정 게시물에 대해 제목,내용만 수정 가능
		String sql = "update board" + 
		             "   set board_subject = ?," +
				     "       board_content = ?," +
		             "       board_date = now()" +
		             " where board_num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,article.getBOARD_SUBJECT());
			pstmt.setString(2,article.getBOARD_CONTENT());
			pstmt.setInt(3,article.getBOARD_NUM());
			
			updateCount = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardModify() 에러:" + e);
		}finally {
			close(pstmt);
		}
		
		return updateCount;
				
	}
	
	//특정 게시물 삭제처리를 하는 메서드
	//특정 게시물 삭제처리시에는 게시물 번호만 필요
	public int deleteArticle(int board_num) {
		
		PreparedStatement pstmt = null;
		String board_delete_sql = 
				"delete from board where board_num = ?";
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1,board_num);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardDelete() 에러:" + e);
		}finally {
			close(pstmt);
		}
		
		//삭제를 한 건수 리턴(1)
		return deleteCount;
	}
	//조회수 증가처리를 하는 메서드
	public int updateReadCount(int board_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update board" +
		             "   set board_readcount = board_readcount + 1" +
				     " where board_num = " + board_num;
		
		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
 		}catch(Exception e) {
			System.out.println("updateReadCount() 에러:" + e);
		}finally {
			close(pstmt);
		}
		
		return updateCount;//수정된 건수가 리턴(1)
	}
	
	//특정 게시물 수정,삭제처리시 권한 여부 체크
	public boolean isArticleBoardWriter(int board_num,String pass) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql = 
			"select * from board where board_num = ?";
		boolean isWriter = false;
		
		try {
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1,board_num);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			//비밀번호를 체크해서 입력한 비밀번호가 동일 경우
			//특정 게시물 수정 혹은 삭제처리 가능
			if(pass.equals(rs.getString("BOARD_PASS"))) {
				isWriter = true;
			}
		}catch(Exception e) {
			System.out.println("isArticleBoardWriter() 에러:" + e);
		}finally {
			close(pstmt);
		}
		
		return isWriter;
	}
//	
}