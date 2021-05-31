package PKG_main;
import PKG_Character.Caracter;
import PKG_Magic.*;

public class main_Play {

	public static void main(String[] args) {
		FireBall fireball = new FireBall("파이어볼", 10, 10);
		iceBolt icebolt = new iceBolt("아이스볼트", 10, 10);
		
		Caracter Wizard = new Caracter("마법사1", 100, 100);
		
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
