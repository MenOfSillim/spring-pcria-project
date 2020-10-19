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
		
		model.addAttribute(Const.VIEW, "main/seat");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
}
