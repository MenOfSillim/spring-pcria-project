package com.pcria.access;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pcria.Const;
import com.pcria.access.model.AccessVO;

@Controller
@RequestMapping("/access")
public class AccessController {
	
	@Autowired
	private AccessService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam(defaultValue="0") int err) {
		model.addAttribute(Const.CSS, "access/login");
		
		if(err > 0) { // 회원가입 실패
			model.addAttribute("msg", "에러가 발생하였습니다");
		}
		
		return "/access/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(AccessVO param, RedirectAttributes ra) {
		int result = service.join(param);
		
		if(result == 1) { // 회원가입 성공
			return "redirect:/access/login";
		}
		ra.addAttribute("err", result);
		return "redirect:/access/login";
	}
	
	@RequestMapping(value="/ajaxIdChk", method = RequestMethod.POST)
	@ResponseBody // 이것을 통해 jsp파일을 찾지 않게 된다
	public String ajaxIdChk(@RequestBody AccessVO param) {
		System.out.println("u_id : " + param.getU_id());
		int result = service.login(param);
		return String.valueOf(result); // 값 자체를 응답
	}
}
