package PKG_Board_Service;

import org.springframework.stereotype.Service;

@Service
public class Board2Service implements boardServiceimpl{

	@Override
	public String getBoardList() {
		
		//1.DB연결
		
		//2.SELECT 날린다. -> 결과 받아온다.
		
		String strList = "게시판 리스트 결과";
		
		return strList;
		
	}
	
	@Override
	public String saveBoard(String strWrite) {
		
		String strResult = strWrite + "가 저장";
		
		return strResult;
		
	}
	
}
