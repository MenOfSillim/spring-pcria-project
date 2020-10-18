package com.pcria.access;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/access")
public class AccessController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "/access/login";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		
		return "/access/join";
	}
	
}
