package PKG_Std;
import PKG_Test.Classes;

public class StdExample {

	public static void main(String[] args) {
		
		Student st = new Student();
		st.sName1 = "��";
		st.sName2 = "��";
		st.sName3 = "��";
		
		Student st2 = new Student();
		st2.sName1 = "ȫ";
		st2.sName2 = "��";
		st2.sName3 = "��";
		
		Student st3 = new Student();
		st3.sName1 = "��";
		st3.sName2 = "��";
		st3.sName3 = "ġ";
		
		Student st4 = new Student();
		st4.sName1 = "��";
		st4.sName2 = "��";
		st4.sName3 = "��";
		
		
		Classes firstClass = new Classes();
		
		firstClass.addStudent(st);
		firstClass.addStudent(st2);
		firstClass.addStudent(st3);
		firstClass.addStudent(st4);
		Student[] student = firstClass.getStudentsList();
		
		for(int i = 0; i < student.length; i++) {
			
			System.out.println(student[i].sName1 + student[i].sName2 + student[i].sName3);
			
		}
		
	}
}
