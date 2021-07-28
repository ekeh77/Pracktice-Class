import java.sql.ResultSet;

import PKG_AUTH.AuthDelete;
import PKG_AUTH.AuthSelect;
import PKG_AUTH.DeleteDAO;
import PKG_AUTH.MemberDelete;
import PKG_IOC.*;

public class SpringTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		//Dependency Injection 의존주입
		//has a 관계 - 객체 자동차 : 타이어, 엔진, ...
		
		Car car1 = new Car(new ATire()); // ATire를 기본으로 장착 - BTire 아직 출시가 되지 않았다
		
		car1.outTireKind();
		
		Car car2 = new Car(new ATire());
		
		car2.outTireKind();
		
		//BTire가 출시가 되었고, 가격이 BTire가 더 싸요
		
		Car car3 = new Car(new BTire()); //BTire
		
		car3.outTireKind();
		
		//ATire가격이 더 싸졌어요
		
		Car car4 = new Car(new ATire()); //ATire
		
		car4.outTireKind();
		
		//CTire 출시 가격이 대박
		
		Car car5 = new Car(new CTire());
		
		car5.outTireKind();
		
		//car1이 시간이 흘러 타이어를 교체할 때가 되었다
		
		car1.setTire(new CTire());
		
		car1.outTireKind();
		
		//car5 CTire를 장착하고 출시되었으나, 사고가 발생해서 BTire로 교체를 한다
		
		car5.setTire(new BTire());
		
		car5.outTireKind();
		*/
		
		//has a 관계를 가지고 가는데 행위에서 has a
		//출력방법이 다르다
		
		//1.출력방법 APrint - 특정모양 그리드
		//2.출력방법 Bprint - 특정모양 그래프
		/*
		Score score = new Score();
		
		/*
		Print pr = new Print();
		pr.setScore(score);
		pr.printGrid();
		pr.printGraph();
		pr.printText();
		
		
		IPrint print1 = new APrint();
		print1.setScore(score);
		print1.outPrint();
		
		IPrint print2 = new BPrint();
		print2.setScore(score);
		print2.outPrint();
		*/
		/*
		Hello h = new Hello();
		h.setMsg("안녕하세요");
		*/
		//maven project
		//ApplicationContext app = new ClassPathXmlApplicationContext("aaa.xml");

		
		//XML을 활용해서 코딩을 할 수 있다
		//Spring FrameWork에서
		/*
		Car car = new Car();
		car.setTire(new T1());
		
		car.getTire();
		
		car.setTire(new T2());
		
		car.getTire();
		*/
		/*
		AuthSelect as = new AuthSelect();
		as.setCRUD();
		
		ResultSet rs = as.getResultSet();
		
		AuthDelete ad = new AuthDelete();
		ad.setCRUD();
		*/
		/*
		//1.member row 삭제
		MemberDelete md = new MemberDelete();
		md.setDelete();
		//2.Auth row 삭제
		AuthDelete ad = new AuthDelete();
		ad.setDelete();
		*/
		
		DeleteDAO dd = new DeleteDAO();
		
		dd.setDelete(new MemberDelete());
		
	}
		
}
