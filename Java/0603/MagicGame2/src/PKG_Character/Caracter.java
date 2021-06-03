package PKG_Character;
import java.util.ArrayList;
import java.util.Scanner;

import PKG_Magic.*;

public class Caracter {
	private String CName;
	private int MaxHP;
	private int CurHP;
	private int MaxMP;
	private int CurMP;
	private Magic magic;
	private ArrayList<Magic> magicList;
	
	public Caracter(String CName, int MaxMP, int MaxHP) {
		
		this.CName = CName;
		this.MaxMP = MaxMP;
		this.CurMP = MaxMP;
		this.MaxHP = MaxHP;
		this.CurHP = MaxHP;
		this.magicList = new ArrayList();
		
	}
	
	public void CInfo() {
		
		System.out.println("�̸� : " + this.CName);
		System.out.println("�ִ븶�� : " + this.MaxMP);
		System.out.println("���縶�� : " + this.CurMP);
		
	}
	
	public void learnMagic(Magic magic) {
		int countNum = 0;
		String MName = magic.getMName();
		for(int i = 0; i < this.magicList.size(); i++) {
			
			if(magic == this.magicList.get(i)) {
				countNum += 1;
			}
			
		}
		
		if(countNum >= 1) {
			System.out.println("�̹� ��� �����Դϴ�");
		}
		else {
			System.out.println(MName +"�� ������ϴ�");
			this.magicList.add(magic);
			this.magic = magic;
		}
		
	}
	
	public void haveMagic() {
		
		System.out.println("���� ��� ������...");
		
		if(this.magicList.size() == 0) {
			
			System.out.println("�����ϴ�");
		}
		else {
			for(int i = 0; i < this.magicList.size(); i++) {
				
				String MName = this.magicList.get(i).getMName();
				System.out.println((i + 1) + ". " + MName);
				
			}
			
			System.out.println("�Դϴ�");
			
			magicInfo();
		}
		
	}
	
	public void magicInfo() {
		
		Scanner Choice = new Scanner(System.in);
		System.out.println("���Ͻô� ���� ������ �������ּ���");
		int WLook = 0;
		WLook = Choice.nextInt();
		if(WLook > this.magicList.size() || WLook <= 0) {
			System.out.println("���������Դϴ�");
		}
		else {
			this.magicList.get(WLook-1).magicInfo();
			
		}
		
			
	}
	
	public void chgMagic() {
		
		if(this.magicList.size() <= 1) {
			
			System.out.println("�ٲ� ������ �����ϴ�");
		}
		else {
			
			System.out.println("���� ��� ������...");
			
			for(int i = 0; i < this.magicList.size(); i++) {
				
				String MName = this.magicList.get(i).getMName();
				System.out.println((i + 1) + ". " + MName);
				
			}
			
			System.out.println("�Դϴ�");
			
			
			Scanner Choice = new Scanner(System.in);
			System.out.println("�ٲٱ� ���ϴ� ������ �������ּ���");
			int WChg = 0;
			WChg = Choice.nextInt();
			
			if(WChg > this.magicList.size() || WChg <= 0) {
				System.out.println("���¸����Դϴ�");
			}
			else {
				
				String MName = this.magicList.get(WChg-1).getMName();
				System.out.println(MName + "�� ������ �ٲپ����ϴ�");
				this.magic = this.magicList.get(WChg-1);
				
			}
			
		}
		
		
		
		
	}
	
	public void useingMagic() {
		
		if(this.magicList.size() == 0) {
			
			System.out.println("����� ������ �����ϴ�");
			
		}
		else {
		
			int useMP = this.magic.getUseMP();
			
			if(CurMP < useMP) {
				
				System.out.println("������ �����մϴ�");
				
			}
			else {
				
				MinusMP(useMP);	
				this.magic.useMagic();
				
			}
			
		}
		
	}
	
	public void PlusMP(int num) {
		
		if(this.MaxMP > this.CurMP) {
			
			this.CurMP = this.MaxMP;
			
		}
		else {
			
			this.CurMP += num;
			
		}
		
	}
	
	public void MinusMP(int num) {
		
		if(this.CurMP <= 0 ) {
			
			this.CurMP = 0;
			
		}
		else {
			
			this.CurMP -= num;
			
		}
		
	}
	
}
