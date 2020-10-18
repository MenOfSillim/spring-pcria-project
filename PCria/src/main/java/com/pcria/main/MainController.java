package com.pcria.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping(value = "/seat", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "/template/mainTemplate";
	}
}
