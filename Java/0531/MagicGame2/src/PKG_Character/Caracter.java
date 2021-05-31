package PKG_Character;
import java.util.ArrayList;
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
		
		this.magicList.add(magic);
		this.magic = magic;
		
	}
	
	public void haveMagic() {
		
		System.out.println("���� ��� ������...");
		
		for(int i = 0; i < this.magicList.size(); i++) {
			
			String MName = this.magicList.get(i).getMName();
			System.out.println(MName);
			
		}
		
		System.out.println("�Դϴ�");
	}
	
	public void magicInfo() {
		
		this.magic.magicInfo();
		
	}
	
	public void chgMagic(int num) {
		
		String MName = this.magicList.get(num).getMName();
		System.out.println(MName + "�� ������ �ٲپ����ϴ�");
		this.magic = this.magicList.get(num);
		
	}
	
	public void useingMagic() {
		
		int useMP = this.magic.getUseMP();
		
		if(CurMP < useMP) {
			
			System.out.println("������ �����մϴ�");
			
		}
		else {
			
			MinusMP(useMP);	
			this.magic.useMagic();
			
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
