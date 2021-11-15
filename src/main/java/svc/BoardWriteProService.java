package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;

//게시물 등록 처리를 하는 비즈니스 로직을 구현한 서비스 클래스
public class BoardWriteProService {

	//신규 게시물 등록처리
	public boolean registArticle(BoardBean boardBean) {
		
		boolean isWriteSuccess = false;
		//Connection Pool에서 Free한  Connection 연결
		Connection con = getConnection();
		//싱글톤 패턴(SingleTon Pattern)
		//싱글톤 패턴은 최초에 한번만 인스턴스를 힙메모리에 생성하고
		//이후부터는 공유해서 사용한다.
		//DAO(Data Access Object)
		//데이터베이스와 연동하여 데이터처리(insert,update,delete,select)
		//를 하기위한 객체
		//DTO(Data Transfer Object)
		//VO라고도 하며 데이터베이스에 데이터를 가져오거나 데이터를
		//대입처리하는 자바빈즈를 말한다.(즉 getter/setter 메서드를
		//통해서 데이터를 가져오거나 데이터를 대입처리할 수 있다.)
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		//신규 게시물 입력처리
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isWriteSuccess;
		
	}
}





