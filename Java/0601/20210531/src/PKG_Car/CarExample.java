package PKG_Car;

import java.util.ArrayList;

public class CarExample {

	public static void main(String[] args) {
		
		//Car car = new Car();
		//불가능 추상클래스틑 인스턴스화 할 수 없다
		/*
		Car car = new Sedan();
		//묵시적형변환 -> up casting
		car.carRun();
		car.carStop();
		
		Sedan sedan = new Sedan();
		sedan.carRun();
		sedan.carStop();
		sedan.comfotable();
		
		Car flycar = new FlyCar();
		flycar.carRun();
		flycar.carStop();
		
		FlyCar flycar2 = new FlyCar();
		flycar2.carFly();
		
		Member mem = new Member();
		
		mem.rideCar(sedan);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(flycar2);
		mem.carRun();
		mem.carFly();
		
		if(car instanceof Sedan) {
			((Sedan)car).comfotable();
			//down Casting
		}
		
		if(flycar instanceof FlyCar) {
			((FlyCar)car).carFly();
		}
		*/
		
		Sedan sedan = new Sedan();
		FlyCar flycar = new FlyCar();
		MultiCar multicar = new MultiCar();
		
		
		Member mem = new Member();
		
		mem.rideCar(sedan);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(flycar);
		mem.carRun();
		mem.carFly();
		
		mem.rideCar(multicar);
		mem.carRun();
		mem.carFly();
		
		/*
		Car[] cars = new Car[4];
		cars[0] = new Sedan();
		cars[1] = new FlyCar();
		cars[2] = new MultiCar();
		cars[3] = new Sedan();
		
		//콜렉션 ArrayList > 배열의 갯수를 마음대로 정할 수 있는 배열
		//이 리스트는 넣을때 한가지타입이 아닌 여러가지 타입으로 넣을 수 있다
		//그러나 꺼내올때 타입을 맞춰서 알아서 꺼내야하기 때문에 하지않는편이 좋다
		ArrayList cars2 = new ArrayList();
		cars2.add(sedan);
		cars2.add(sedan);
		cars2.add(flycar);
		cars2.add(multicar);
		
		
		//ArrayList의 길이확인 > size()
		//ArrayList의 요소가져오기 > get(i)
		//ArrayList는 OBj이기 때문에 원하는 객체로 캐스팅 필요
		for(int i = 0; i<cars2.size(); i++) {
			((Car)cars2.get(i)).carRun();
		}
		*/
		
		ArrayList arr = new ArrayList();
		arr.add(5);// 그냥 넣기
		arr.add("asdfg");
		boolean b = arr.add(1.23456);
		System.out.println(b);
		arr.add(1, "강강강");// 수정과 추가 가능
		System.out.println(arr.get(1));
		
		//제네릭 타입
		//Array 타입을 String으로 제한
		ArrayList<String> strArr = new ArrayList<String>();
		//Array 타입을 Car타입으로 제한
		ArrayList<Car> carArr = new ArrayList<Car>();
		
		Park park = new Park();
		park.carPark(sedan);
		park.carPark(flycar);
		
		park.getCarList();
	}

}
