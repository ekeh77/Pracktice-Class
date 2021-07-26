package PKG_Score;

public class Print {

	private Score score;
	private int sumScore;
	
	public Print() {
		
	}
	
	public void setScore(Score score) {
		this.score = score;
		sumScore = score.getSum();
	}
	
	public void printGrid() {
		System.out.println("그리드로 총점 출력 :" + sumScore);
		
	}
	
	public void printGraph() {
		System.out.println("그래프로 총점 출력 :" + sumScore);
	}
	
	public void printText() {
		System.out.println("텍스트로 총점 출력 :" + sumScore);
	}
}
