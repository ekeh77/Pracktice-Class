package PKG_Car;
import java.util.ArrayList;

public class Park {

	private ArrayList<Car> parkCars;
	private ArrayList<Fly> flyCars;
	
	public Park() {
		this.parkCars = new ArrayList<Car>();
		this.flyCars = new ArrayList<Fly>();
	}
	
	public void carPark(Car car) {
		if(car instanceof Fly) {
			flyCars.add((Fly)car);
		}
		else {
			parkCars.add(car);
		}
		
	}
	
	public void getCarList() {
		
		for(int i = 0; i< parkCars.size(); i++) {
			
			System.out.println(((Car)parkCars.get(i)).toString());
			
		}
		
	}
	
	public void getFlyCarList() {
	
		for(int i = 0; i< parkCars.size(); i++) {
			
			System.out.println(((Fly)flyCars.get(i)).toString());
			
		}
	}
	
}
