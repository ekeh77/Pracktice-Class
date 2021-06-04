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
		
		System.out.println("이름 : " + this.CName);
		System.out.println("최대마나 : " + this.MaxMP);
		System.out.println("현재마나 : " + this.CurMP);
		
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
			System.out.println("이미 배운 마법입니다");
		}
		else {
			System.out.println(MName +"을 배웠습니다");
			this.magicList.add(magic);
			this.magic = magic;
		}
		
	}
	
	public void haveMagic() {
		
		System.out.println("현재 배운 마법은...");
		
		if(this.magicList.size() == 0) {
			
			System.out.println("없습니다");
		}
		else {
			for(int i = 0; i < this.magicList.size(); i++) {
				
				String MName = this.magicList.get(i).getMName();
				System.out.println((i + 1) + ". " + MName);
				
			}
			
			System.out.println("입니다");
			
			magicInfo();
		}
		
	}
	
	public void magicInfo() {
		
		Scanner Choice = new Scanner(System.in);
		System.out.println("원하시는 마법 정보를 선택해주세요");
		int WLook = 0;
		WLook = Choice.nextInt();
		if(WLook > this.magicList.size() || WLook <= 0) {
			System.out.println("없는정보입니다");
		}
		else {
			this.magicList.get(WLook-1).magicInfo();
			
		}
		
			
	}
	
	public void chgMagic() {
		
		if(this.magicList.size() <= 1) {
			
			System.out.println("바꿀 마법이 없습니다");
		}
		else {
			
			System.out.println("현재 배운 마법은...");
			
			for(int i = 0; i < this.magicList.size(); i++) {
				
				String MName = this.magicList.get(i).getMName();
				System.out.println((i + 1) + ". " + MName);
				
			}
			
			System.out.println("입니다");
			
			
			Scanner Choice = new Scanner(System.in);
			System.out.println("바꾸길 원하는 마법을 선택해주세요");
			int WChg = 0;
			WChg = Choice.nextInt();
			
			if(WChg > this.magicList.size() || WChg <= 0) {
				System.out.println("없는마법입니다");
			}
			else {
				
				String MName = this.magicList.get(WChg-1).getMName();
				System.out.println(MName + "로 마법을 바꾸었습니다");
				this.magic = this.magicList.get(WChg-1);
				
			}
			
		}
		
		
		
		
	}
	
	public void useingMagic() {
		
		if(this.magicList.size() == 0) {
			
			System.out.println("사용할 마법이 없습니다");
			
		}
		else {
		
			int useMP = this.magic.getUseMP();
			
			if(CurMP < useMP) {
				
				System.out.println("마나가 부족합니다");
				
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
