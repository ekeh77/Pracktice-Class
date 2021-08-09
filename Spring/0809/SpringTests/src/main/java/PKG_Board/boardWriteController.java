package PKG_Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import PKG_Board_Service.BoardService;
import PKG_Board_Service.boardServiceimpl;

public class boardWriteController implements Controller{

	private boardServiceimpl boardServiceImpl;
	
	public void setBoardService(boardServiceimpl boardServiceImpl) {
		this.boardServiceImpl = boardServiceImpl;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("writeController");
		
		//BoardService bs = new BoardService();
		
		String strWrite = boardServiceImpl.saveBoard("안녕");
		
		//String strWrite = "write - 글쓰기 폼";
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("write", strWrite);
		
		mv.setViewName("/Board/write");
		
		return mv;
	}
	
}
