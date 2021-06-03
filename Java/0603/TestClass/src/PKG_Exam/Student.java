package PKG_Exam;

public class Student {

	//속성 - 이름
	public String name;
	private int totalScore;
	private int examCount;
	private double avgScore;
	
	//행위 - 시험을친다 (어떤과목) > 4과목 시험
	//method
	public void exam(String strSubject, int score) {
		
		System.out.println(name + "학생의 " + strSubject + "과목점수는 " + score);
		
		setTotal(score);
	}
	
	private void setTotal(int score) {
		
		totalScore += score;
		examCount += 1;
		avgScore = totalScore / examCount;
		
	}
	
	public void getTotal() {
		System.out.println(name + "학생의 총점은 " + totalScore);
	}
	
	public void getAvg() {
		System.out.println(name + "학생의 평균점수는 " + avgScore);
	}
	
}
