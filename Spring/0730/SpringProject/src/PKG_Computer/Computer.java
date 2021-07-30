package PKG_Computer;

public class Computer {

	private MainBoard mainBoard;
	
	public Computer() {
		
	}
	
	public Computer(MainBoard mainBoard) {
		this.mainBoard = mainBoard;
	}
	
	public void setMainBoard(MainBoard mainBoard) {
		this.mainBoard = mainBoard;
	}
	
	public void getMainBoard() {
		this.mainBoard.getMainBoard();
	}
}
