
public class ExceptionTest {

	public static void main(String[] args) {
		
		//예외처리 : 프로그램을 배포하고 런타임에서 에러가 발생하면 자연스럽게 그 에러를 처리하기 위해서 사용
		//C# C++ 예외처리를 개발자가 하지 않으면 그냥 하지 않는다
		//JAVA는 엔진이 판단했을 때 에러가 발생할 소지가 있다면 강제로 예외처리를 시킨다
		
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
			//Class Exception 타입
			//String strMsg = e.getMessage();//배포할 때 사용 에러를 간단히 설명
			//System.out.println(strMsg);
			
			//e.printStackTrace();//개발할 때만 사용
			
			
			String strMsg = e.toString();//조금 자세하게 에러를 설명
			System.out.println(strMsg);
			
		}
		finally {
			System.out.println("finally");
		}

	}

}
