package PKG_Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*import org.springframework.web.servlet.mvc.Controller;*/

import PKG_Board_Service.BoardService;
import PKG_Board_Service.boardServiceimpl;

@Controller
public class boardListController{
	
	@RequestMapping("/list.do")
	public void something() {
		System.out.println("list.do");
	}
	
	/*
	private boardServiceimpl boardServiceImpl;
	
	public void setBoardService(boardServiceimpl boardServiceImpl) {
		this.boardServiceImpl = boardServiceImpl;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("List Controller");
		//업무로직 처리
		//String strList = "list - 게시판리스트";
		
		//boardServiceImpl bs = new BoardService();
		
		String strList = boardServiceImpl.getBoardList();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", strList);
		
		mv.setViewName("/Board/list");
		
		
		return mv;
		
	}
	*/
}
