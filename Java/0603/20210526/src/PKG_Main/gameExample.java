package PKG_Main;
import PKG_Game.*;
import PKG_Game.Character;

public class gameExample {

	public static void main(String[] args) {
		
		Fighter f1 = new Fighter("�ο��", "��");
		f1.run();
		f1.stop();
		f1.fight();
		String f1_weapon = f1.getWName();
		
		Fighter f2 = new Fighter("�߿���");
		f2.run();
		f2.stop();
		f2.fight();
		f2.setWName("����");
		f2.fight();
		f2.fly();
		
		Wizard w1 = new Wizard("�տ���", "��������");
		w1.run();
		w1.stop();
		w1.magic();
		String mName = w1.getWName();
		w1.fly();
		
		Healer h1 = new Healer("ġ���", "����");
		h1.run();
		h1.stop();
		h1.heal();
		h1.fly();
		
		Character C = new Wizard("1","2");
		Wizard W = new Wizard("1","2");
		C.fly();
		W.fly();
	}

}
