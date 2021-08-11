package PKG_Score.Service.Impl;

import java.util.ArrayList;

import PKG_Score.Dao.ScoreVo;

public interface ScoreServiceImpl {
	
	 ArrayList<ScoreVo> getScoreList();
	
	 void saveScore(ScoreVo scorevo);
}
