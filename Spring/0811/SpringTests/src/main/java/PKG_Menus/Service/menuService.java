package PKG_Menus.Service;

import org.springframework.stereotype.Service;
import PKG_Menus.Service.impl.menuServiceImpl;

@Service
public class menuService implements menuServiceImpl{
	
	@Override
	public String getMenuList() {
		
		String strMenuList = "데이터";
		
		return strMenuList;
	}
	
	@Override
	public String saveMenus(){
		
		return "saveMenus";
	}
	
	@Override
	public String updateMenus() {
		
		return "updateMenus";
		
	}
	
	@Override
	public String deleteMenus() {
		
		return "deleteMenus";
		
	}
}
