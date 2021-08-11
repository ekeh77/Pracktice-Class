package PKG_Score.Service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import PKG_Score.Dao.ScoreVo;
import PKG_Score.Service.Impl.ScoreServiceImpl;

@Service
public class ScoreService implements ScoreServiceImpl{
		
	@Override
	public ArrayList<ScoreVo> getScoreList() {
		
		//업무처리
		//DB연결
		ScoreVo vo1 = new ScoreVo();
		ScoreVo vo2 = new ScoreVo();
		ScoreVo vo3 = new ScoreVo();
		
		vo1.setsID("S001");
		vo1.setsName("홍길동");
		vo1.setTotalScore("360");
		
		vo2.setsID("S002");
		vo2.setsName("홍길동2");
		vo2.setTotalScore("260");
		
		vo3.setsID("S003");
		vo3.setsName("홍길동3");
		vo3.setTotalScore("280");
		
		ArrayList<ScoreVo> arrScore = new ArrayList<ScoreVo>();
		
		arrScore.add(vo1);
		arrScore.add(vo2);
		arrScore.add(vo3);
		
		return arrScore;
		
	}
	
	public void saveScore(ScoreVo scorevo) {
		
	}
	
}
