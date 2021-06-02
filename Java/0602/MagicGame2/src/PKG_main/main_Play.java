package PKG_main;
import java.util.Scanner;

import PKG_Character.Caracter;
import PKG_Magic.*;

public class main_Play {

	public static void main(String[] args) {
		
		FireBall fireball = new FireBall("파이어볼", 10, 10);
		iceBolt icebolt = new iceBolt("아이스볼트", 10, 10);
		LightningBolt LBolt = new LightningBolt("라이트닝볼트", 10, 10); 
		
		
		Caracter Wizard = new Caracter("마법사1", 100, 100);
		
		
		Wizard.learnMagic(fireball);
		Wizard.learnMagic(icebolt);
		Wizard.haveMagic();
		Wizard.chgMagic(1);
		
		Scanner Choice = new Scanner(System.in);
		
		int start_Game = 0;
		
		while(start_Game <= 4) {
			
			System.out.println("원하시는 행동을 선택해주세요 1:마법 배우기 2:배운마법 확인 3:마법 바꾸기 4:마법 사용");
			
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
