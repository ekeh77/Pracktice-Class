package PKG_DB2;

public class DBHandle {
	
	public void dbSelect() {
		
		//db연결을 위한 코딩 -- Connection 객체
		dbCon();
		//preparedStatement -- ps 객체 > proc 선택
		dbPs();
		//rs > arraylist <== 업무로직이 포함될 가능성
		dbResult();
	}
	
	public void dbCon() {
		//db연결을 위한 코딩 -- Connection 객체
	}
	
	public void dbPs() {
		//preparedStatement -- ps 객체 > proc 선택
	}
	
	public void dbResult() {
		//rs > arraylist <== 업무로직이 포함될 가능성
	}
}
