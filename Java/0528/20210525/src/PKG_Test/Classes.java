package PKG_Test;
import PKG_Std.Student;

public class Classes {
	
	private Student[] students;
	private int arrNum;
	
	
	public Classes() {
		
		this.students = new Student[3];
		this.arrNum = 0;
		
	}
	
	public void addStudent(Student student) {
		
		if(arrNum < 3) {
			students[arrNum] = student;
			arrNum++;
		}
		else {
			System.out.println("4명 이상은 등록할 수 없습니다");
		}
	}
	
	public Student[] getStudentsList() {
		
		/*
		for(int i = 0; i < students.length; i++) {
			
			System.out.println(students[i].sName1);
			
		}
		*/
		return students;
		
	}
	
}
