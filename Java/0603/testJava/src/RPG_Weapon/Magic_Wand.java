package RPG_Weapon;

import java.util.Scanner;

public class Magic_Wand extends Weapon{
	
	public Magic_Wand(String wName, int wPower, int wHand) {
		super(wName, wPower, wHand);
	}
	
	public int Magic_Cast() {
		System.out.println("마법사용을 준비합니다");
		System.out.println("어떤마법을 준비합니까?1:파이어볼 2:아이스볼트 3:라이트닝");
		Scanner what_Magic = new Scanner(System.in);
		int MagicNum = what_Magic.nextInt();

		return MagicNum;
	}
	
	public void useWeapon() {
		
		int MagicNum = Magic_Cast();
		String MagicName = "";
		if(MagicNum == 1) {
			MagicName = "파이어볼";
		}
		else if(MagicNum == 2) {
			MagicName = "아이스볼트";
		}
		else if(MagicNum == 3) {
			MagicName = "라이트닝";
		}
		if(MagicNum >= 1 && MagicNum <= 3) {
			System.out.println(MagicName + "을 사용합니다");
		}
		else {
			System.out.println("마법 사용을 취소합니다!");
		}
		
	}
}
