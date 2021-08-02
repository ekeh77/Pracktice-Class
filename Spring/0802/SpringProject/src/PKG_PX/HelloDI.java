package PKG_PX;

public class HelloDI {
	
	
	private IHello ihello;
	
	public void setGreeting(IHello ihello) {
		
		this.ihello = ihello;
		
		ihello.greeting();
	}
}
