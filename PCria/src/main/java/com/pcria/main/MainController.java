package com.pcria.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcria.Const;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping(value = "/seat", method = RequestMethod.GET)
	public String seat(Model model) {
		
		model.addAttribute(Const.MENU_ID, "seat");
		model.addAttribute(Const.VIEW, "main/seat");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/usageTime", method = RequestMethod.GET)
	public String usageTime(Model model) {
		
		model.addAttribute(Const.MENU_ID, "usageTime");
		model.addAttribute(Const.VIEW, "main/usageTime");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String food(Model model) {
		
		model.addAttribute(Const.MENU_ID, "food");
		model.addAttribute(Const.VIEW, "main/food");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		
		model.addAttribute(Const.MENU_ID, "profile");
		model.addAttribute(Const.VIEW, "main/profile");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) {
		
		model.addAttribute(Const.MENU_ID, "myPage");
		model.addAttribute(Const.VIEW, "main/myPage");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
}
