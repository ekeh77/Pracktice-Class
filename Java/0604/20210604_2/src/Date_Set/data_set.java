package Date_Set;

import java.awt.Toolkit;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class data_set {
	public static void main(String[] args) {
	
		Date now = new Date();
		String strNow1 = now.toString();
		System.out.println(strNow1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		
		String strNow2 = sdf.format(now);
		System.out.println(strNow2);
		
		Calendar now2 = Calendar.getInstance();
		
		int year = now2.get(Calendar.YEAR);
		int month = now2.get(Calendar.MONTH) + 1;
		int day = now2.get(Calendar.DAY_OF_MONTH);
		int week = now2.get(Calendar.DAY_OF_WEEK);
		int ampm = now2.get(Calendar.AM_PM);
		
		System.out.println(ampm);
		
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		
		toolkit.beep();
	}
	
	
}
