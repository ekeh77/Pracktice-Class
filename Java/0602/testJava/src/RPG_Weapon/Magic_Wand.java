package RPG_Weapon;

import java.util.Scanner;

public class Magic_Wand extends Weapon{
	
	public Magic_Wand(String wName, int wPower, int wHand) {
		super(wName, wPower, wHand);
	}
	
	public int Magic_Cast() {
		System.out.println("��������� �غ��մϴ�");
		System.out.println("������� �غ��մϱ�?1:���̾ 2:���̽���Ʈ 3:����Ʈ��");
		Scanner what_Magic = new Scanner(System.in);
		int MagicNum = what_Magic.nextInt();

		return MagicNum;
	}
	
	public void useWeapon() {
		
		int MagicNum = Magic_Cast();
		String MagicName = "";
		if(MagicNum == 1) {
			MagicName = "���̾";
		}
		else if(MagicNum == 2) {
			MagicName = "���̽���Ʈ";
		}
		else if(MagicNum == 3) {
			MagicName = "����Ʈ��";
		}
		if(MagicNum >= 1 && MagicNum <= 3) {
			System.out.println(MagicName + "�� ����մϴ�");
		}
		else {
			System.out.println("���� ����� ����մϴ�!");
		}
		
	}
}
