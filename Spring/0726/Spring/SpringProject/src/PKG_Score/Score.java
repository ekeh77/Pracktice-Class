package PKG_Score;

public class Score {
	
	private String sName;
	private int kor;
	private int math;
	private int eng;
	
	public void setScore() {
		//DB에 연결해서 SELECT 해서 가지고 왔다
		
		this.sName = "홍길동";
		this.kor = 90;
		this.math = 90;
		this.eng = 80;
	}
	
	public int getSum() {
		setScore();
		int sumScore = kor + math + eng;
		
		return sumScore;
	}
	
	public void setPrint() {
		
	}
	
}
