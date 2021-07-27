package PKG_Score;

public class APrint implements IPrint{
	//성적을 출력 하고 싶다
	//그리드를 활용해서 출력한다
	private Score score;
	//1. 성적을 가지고 와야한다
	public APrint() {
		
	}
	
	@Override
	public void outPrint() {
		int Pscore = score.getSum();
		System.out.println("그리드로 출력 : " + Pscore);
	}
	
	@Override
	public void setScore(Score score) {
		this.score = score;
	}
}
