package PKG_Start;

import PKG_Cal.Calculator;//사용하기 위해서 가져오는 명령어

public class Str {

	public static void main(String[] args) {
		
		Calculator cal = new Calculator();
		
		int r1 = cal.setPlus(9,5);
		int r2 = cal.setMinus(9,5);
		int r3 = cal.setCross(9,5);
		float r4 = cal.setDevide(9,5);
		
		
		System.out.println(r1);
		System.out.println(r2);
		System.out.println(r3);
		System.out.println(r4);

	}

}
