package PKG_Exam;

public class Student {

	//�Ӽ� - �̸�
	public String name;
	private int totalScore;
	private int examCount;
	private double avgScore;
	
	//���� - ������ģ�� (�����) > 4���� ����
	//method
	public void exam(String strSubject, int score) {
		
		System.out.println(name + "�л��� " + strSubject + "���������� " + score);
		
		setTotal(score);
	}
	
	private void setTotal(int score) {
		
		totalScore += score;
		examCount += 1;
		avgScore = totalScore / examCount;
		
	}
	
	public void getTotal() {
		System.out.println(name + "�л��� ������ " + totalScore);
	}
	
	public void getAvg() {
		System.out.println(name + "�л��� ��������� " + avgScore);
	}
	
}
