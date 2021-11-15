package vo;

//클라이언트 요청을 받아서 뷰 페이지(JSP)로 포워드 처리를
//하기 위한 클래스
public class ActionForward {

	private String path;//경로
	private boolean redirect;//redirect 여부
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	//강제적으로 다른 JSP로 이동처리
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	
}
