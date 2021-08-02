package PKG_PX;

public class Hello implements IHello{
	/*
	private IHello ihello;
	*/
	@Override
	public void greeting() {

		//업무
		System.out.println("Hello");

	}
	@Override
	public void greeting2() {

		//업무
		System.out.println("Hello2");

	}
	/*
	public void sayHello(IHello ihello) {
		
		this.ihello = ihello;
		
	}
	
	@Override
	public void sayHi() {
		
		//업무
		System.out.println("Hi");
		
	}
	*/
}
