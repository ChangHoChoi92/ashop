package vo;

import java.sql.Date;

//테이블 구조와 동일한 클래스로 데이터 관리를 하기 위함
public class BoardBean {

	private int BOARD_NUM;//게시물번호
	private String BOARD_NAME;//게시물 작성자
	private String BOARD_PASS;//게시물 비밀번호
	private String BOARD_SUBJECT;//게시물 제목
	private String BOARD_CONTENT;//게시물 내용
	private String BOARD_FILE;//첨부파일이름
	private int BOARD_RE_REF;//댓글번호
	private int BOARD_RE_LEV;//댓글레벨
	private int BOARD_RE_SEQ;//댓글일련번호
	private int BOARD_READCOUNT;//조회수
	private Date BOARD_DATE;//게시물등록일자
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public String getBOARD_NAME() {
		return BOARD_NAME;
	}
	public void setBOARD_NAME(String bOARD_NAME) {
		BOARD_NAME = bOARD_NAME;
	}
	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}
	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public String getBOARD_FILE() {
		return BOARD_FILE;
	}
	public void setBOARD_FILE(String bOARD_FILE) {
		BOARD_FILE = bOARD_FILE;
	}
	public int getBOARD_RE_REF() {
		return BOARD_RE_REF;
	}
	public void setBOARD_RE_REF(int bOARD_RE_REF) {
		BOARD_RE_REF = bOARD_RE_REF;
	}
	public int getBOARD_RE_LEV() {
		return BOARD_RE_LEV;
	}
	public void setBOARD_RE_LEV(int bOARD_RE_LEV) {
		BOARD_RE_LEV = bOARD_RE_LEV;
	}
	public int getBOARD_RE_SEQ() {
		return BOARD_RE_SEQ;
	}
	public void setBOARD_RE_SEQ(int bOARD_RE_SEQ) {
		BOARD_RE_SEQ = bOARD_RE_SEQ;
	}
	public int getBOARD_READCOUNT() {
		return BOARD_READCOUNT;
	}
	public void setBOARD_READCOUNT(int bOARD_READCOUNT) {
		BOARD_READCOUNT = bOARD_READCOUNT;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public String getBOARD_PASS() {
		return BOARD_PASS;
	}
	public void setBOARD_PASS(String bOARD_PASS) {
		BOARD_PASS = bOARD_PASS;
	}
	
	
}
