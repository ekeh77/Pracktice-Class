
public class ExceptionTest {

	public static void main(String[] args) {
		
		//����ó�� : ���α׷��� �����ϰ� ��Ÿ�ӿ��� ������ �߻��ϸ� �ڿ������� �� ������ ó���ϱ� ���ؼ� ���
		//C# C++ ����ó���� �����ڰ� ���� ������ �׳� ���� �ʴ´�
		//JAVA�� ������ �Ǵ����� �� ������ �߻��� ������ �ִٸ� ������ ����ó���� ��Ų��
		
		try {
			/*
			int i = 0;
			//int i = 4;
			
			int j = 12 / i;
			
			System.out.println(j);
			*/
			
			String[] strs = null;
			strs[0] = "1222";
			
		}
		catch(Exception e) {
			//Class Exception Ÿ��
			//String strMsg = e.getMessage();//������ �� ��� ������ ������ ����
			//System.out.println(strMsg);
			
			//e.printStackTrace();//������ ���� ���
			
			
			String strMsg = e.toString();//���� �ڼ��ϰ� ������ ����
			System.out.println(strMsg);
			
		}
		finally {
			System.out.println("finally");
		}

	}

}
