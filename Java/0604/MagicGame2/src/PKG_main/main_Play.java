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
		
		Scanner Choice = new Scanner(System.in);
		
		int start_Game = 0;
		
		while(start_Game <= 4) {
			
			System.out.println("");
			
			System.out.println("���Ͻô� �ൿ�� �������ּ��� 1:���� ���� 2:���� Ȯ�� 3:���� �ٲٱ� 4:���� ���");
			start_Game = Choice.nextInt();
			if(start_Game == 1) {
				int WLearn = 0;
				System.out.println("���Ͻô� ������ �������ּ��� 1:���̾ 2:���̽���Ʈ 3:����Ʈ�׺�Ʈ");
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
