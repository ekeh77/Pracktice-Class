package Pracktice;

public class GBB {
	public int make_Computer_GBB(int get_Computer_GBB) {
		
		int computer_GBB = 0;
		
		if (get_Computer_GBB == 1) {
			
			computer_GBB = -1;
			
		}
		else if (get_Computer_GBB == 2) {
			
			computer_GBB = -2;
			
		}
		else if (get_Computer_GBB == 3) {
			
			computer_GBB = -3;
			
		}
		else {
			
			System.out.println("올바른 값을 입력해주세요");
			
		}
		
		return computer_GBB;
	}
	
	public int make_Player_GBB(int get_Player_GBB) {
		
		int Player_GBB = 0;
		
		if (get_Player_GBB == 1) {
			
			Player_GBB = 1;
			
		}
		else if (get_Player_GBB == 2) {
			
			Player_GBB = 2;
			
		}
		else if (get_Player_GBB == 3) {
			
			Player_GBB = 3;
			
		}
		else {
			
			System.out.println("올바른 값을 입력해주세요");
			
		}
		
		return Player_GBB;
	}
	
	
	public String convert_int(int computer_Num, int player_Num) {
		
		if computer_Num = -1{
			String computer_String = "가위";
		}
		else if computer_Num = -2{
			String computer_String = "바위";
		}
		else if computer_Num = -3{
			String computer_String = "보";
		}
		
	} 
	
	public void talk_Somthing(String somthing) {

			System.out.println(somthing);
		
	}
	
}
