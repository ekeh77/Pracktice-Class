package PKG_main;
import PKG_Character.Caracter;
import PKG_Magic.*;

public class main_Play {

	public static void main(String[] args) {
		FireBall fireball = new FireBall("���̾", 10, 10);
		iceBolt icebolt = new iceBolt("���̽���Ʈ", 10, 10);
		
		Caracter Wizard = new Caracter("������1", 100, 100);
		
		Wizard.learnMagic(fireball);
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
	}

}
