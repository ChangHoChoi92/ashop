package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//데이터베이스 연동작업에 관련되는 공통기능을 수행하는 클래스
public class JdbcUtil {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQLDB");
			con = ds.getConnection();
			
			System.out.println("데이터베이스 연결 성공");
			
			//자동 commit 사용 안한다는 선언
			con.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
				
	}
	
	public static void close(Connection con) {
		try {
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
			try {
				con.commit();
				System.out.println("Commit 성공");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
			System.out.println("Rollback 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}