package com.pcria.access;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcria.Const;

@Controller
@RequestMapping("/access")
public class AccessController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute(Const.CSS, "access/login");
		
		return "/access/login";
	}
}
