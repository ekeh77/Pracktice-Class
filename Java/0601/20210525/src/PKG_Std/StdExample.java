package PKG_Std;
import PKG_Test.Classes;

public class StdExample {

	public static void main(String[] args) {
		
		Student st = new Student();
		st.sName1 = "±è";
		st.sName2 = "°©";
		st.sName3 = "¼ø";
		
		Student st2 = new Student();
		st2.sName1 = "È«";
		st2.sName2 = "±æ";
		st2.sName3 = "µ¿";
		
		Student st3 = new Student();
		st3.sName1 = "Àü";
		st3.sName2 = "¿ì";
		st3.sName3 = "Ä¡";
		
		Student st4 = new Student();
		st4.sName1 = "±è";
		st4.sName2 = "°©";
		st4.sName3 = "µ¹";
		
		
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
