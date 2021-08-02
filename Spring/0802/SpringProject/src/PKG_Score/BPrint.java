package PKG_Score;

public class BPrint implements IPrint{
	
	private Score score;
	
	public BPrint() {
		
	}
	
	@Override
	public void outPrint() {
		int Pscore = score.getSum();
		System.out.println("그래프로 출력 : " + Pscore);
	}
	
	@Override
	public void setScore(Score score) {
		this.score = score;
	}
	
}
