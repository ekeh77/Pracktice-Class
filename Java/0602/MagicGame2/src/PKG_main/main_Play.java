package PKG_main;
import java.util.Scanner;

import PKG_Character.Caracter;
import PKG_Magic.*;

public class main_Play {

	public static void main(String[] args) {
		
		FireBall fireball = new FireBall("���̾", 10, 10);
		iceBolt icebolt = new iceBolt("���̽���Ʈ", 10, 10);
		LightningBolt LBolt = new LightningBolt("����Ʈ�׺�Ʈ", 10, 10); 
		
		
		Caracter Wizard = new Caracter("������1", 100, 100);
		
		
		Wizard.learnMagic(fireball);
		Wizard.learnMagic(icebolt);
		Wizard.haveMagic();
		Wizard.chgMagic(1);
		
		Scanner Choice = new Scanner(System.in);
		
		int start_Game = 0;
		
		while(start_Game <= 4) {
			
			System.out.println("���Ͻô� �ൿ�� �������ּ��� 1:���� ���� 2:���� Ȯ�� 3:���� �ٲٱ� 4:���� ���");
			
		}
		/*
		Wizard.useingMagic();
		Wizard.magicInfo();
		Wizard.haveMagic();
		Wizard.CInfo();
		Wizard.learnMagic(icebolt);
		Wizard.magicInfo();
		Wizard.haveMagic();
		Wizard.useingMagic();
		Wizard.chgMagic(0);
		Wizard.CInfo();
		*/
	}

}