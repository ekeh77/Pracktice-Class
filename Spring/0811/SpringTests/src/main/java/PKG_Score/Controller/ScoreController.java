package PKG_Score.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import PKG_Score.Dao.ScoreVo;
import PKG_Score.Service.ScoreService;
import PKG_Score.Service.Impl.ScoreServiceImpl;

@Controller
public class ScoreController {
	
	@Autowired
	public ScoreServiceImpl service;
	
	public void setService(ScoreServiceImpl service) {
		this.service = service;
	}
	
	@RequestMapping("/Score/scoreList.do")
	public ModelAndView getScoreList(){
		
		String viewName = "Score/list";
		
		//ScoreService service = new ScoreService();
		ArrayList<ScoreVo> arrScore =  this.service.getScoreList();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("scoreList", arrScore);
		mv.setViewName(viewName);
		
		return mv;
		
	}
	
	//특정 멤버 아이디를 받아서 그 아이디 데이터를 출력
	@RequestMapping("/Score/memberScore.do")
	public String getMemberScore(Model model) {
		
		String viewPage="Score/content";
		
		/*
		String sID = (String)model.getAttribute("sID");
		model.addAttribute("", sID);
		System.out.println(sID);
		*/
		
		
		return viewPage;
		
	}
	
	@RequestMapping("/Score/scoreSave.do")
	public String goSaveScore() {
		return "Score/write";
	}
	
	/*
	@RequestMapping("/Score/scoreRealSave.do")
	public void saveScore(String sID, String sName, String totlaScore) {
		System.out.println(sID);
		System.out.println(sName);
		System.out.println(totlaScore);
	}
	*/
	
	@RequestMapping("/Score/scoreRealSave.do")
	public String saveScore(ScoreVo scorevo) {
		
		System.out.println(scorevo.getsID());
		System.out.println(scorevo.getsName());
		System.out.println(scorevo.getTotalScore());
		
		this.service.saveScore(scorevo);
		
		return "redirect:scoreList.do";
	}
	
}
