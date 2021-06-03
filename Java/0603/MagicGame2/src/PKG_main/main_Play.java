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
		
		Scanner Choice = new Scanner(System.in);
		
		int start_Game = 0;
		
		while(start_Game <= 4) {
			
			System.out.println("");
			
			System.out.println("원하시는 행동을 선택해주세요 1:마법 배우기 2:배운마법 확인 3:마법 바꾸기 4:마법 사용");
			start_Game = Choice.nextInt();
			if(start_Game == 1) {
				int WLearn = 0;
				System.out.println("원하시는 마법을 선택해주세요 1:파이어볼 2:아이스볼트 3:라이트닝볼트");
				WLearn = Choice.nextInt();
				if(WLearn == 1) {
					Wizard.learnMagic(fireball);
				}
				else if(WLearn == 2) {
					Wizard.learnMagic(icebolt);
				}
				else if(WLearn == 3) {
					Wizard.learnMagic(LBolt);;
				}
				
			}
			else if(start_Game == 2) {
				
				Wizard.haveMagic();
				
			}
			else if(start_Game == 3) {
				
				Wizard.chgMagic();
				
			}
			else if(start_Game == 4) {
				
				Wizard.useingMagic();
				
			}
		}
		
	}

}
