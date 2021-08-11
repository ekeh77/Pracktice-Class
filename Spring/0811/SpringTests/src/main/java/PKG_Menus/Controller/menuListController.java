package PKG_Menus.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import PKG_Menus.Dao.MenuVo;
import PKG_Menus.Service.impl.menuServiceImpl;

@Controller
public class menuListController {
	
	private menuServiceImpl menuService;
	
	@Autowired
	public void setMenuListService(menuServiceImpl menuService) {
		this.menuService = menuService;
	}
	
	@RequestMapping("/Menus/menuList.do")
	public ModelAndView getList(String idx, String num) {
		
		System.out.println(idx + num);
		
		String viewPage = "Menus/menuList";
		
		String menuList = menuService.getMenuList();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mList", menuList);
		
		mv.setViewName(viewPage);
		
		return mv;
		
	}
	
	@RequestMapping("/Menus/menuSave.do")
	public ModelAndView saveMenus(MenuVo vo) {
		
		System.out.println(vo);
		
		String menuID = vo.getMenuID();
		
		System.out.println(menuID);
		
		String viewPage = "Menus/menuList";
		
		String menuSave = menuService.saveMenus();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mSave", menuSave);
		
		mv.setViewName(viewPage);
		
		return mv;
		
	}
	
	@RequestMapping("/Menus/menuDel.do")
	public ModelAndView deleteMenus(Model model) {
		
		model.getAttribute(null);
		model.addAttribute(null, model);
		
		String viewPage = "Menus/menuDel";
		
		String menuDel = menuService.saveMenus();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mDel", menuDel);
		
		mv.setViewName(viewPage);
		
		return mv;
		
	}
	
}
