package com.pcria.access;

import javax.servlet.http.HttpSession;

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
import com.pcria.SecurityUtils;
import com.pcria.access.model.AccessVO;
import com.pcria.main.MainService;

@Controller
@RequestMapping("/access")
public class AccessController {
	
	@Autowired
	private AccessService service;
	
	@Autowired
	private MainService main_service;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hs) {
		AccessVO param = new AccessVO();
		param.setS_no(SecurityUtils.getLoginUser(hs).getS_no());
		System.out.println(param.getS_no());
		param.setU_no(SecurityUtils.getLoginUserPk(hs));
		System.out.println(param.getU_no());
		param.setS_occupied(SecurityUtils.getLoginUser(hs).getS_occupied());
		System.out.println(param.getS_occupied());
		main_service.delSeat(param);
		hs.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam(defaultValue="0") int err) {
		model.addAttribute(Const.CSS, "access/login");
		
		if(err > 0) { // 회원가입 실패
			model.addAttribute("msg", "에러가 발생하였습니다");
		}
		
		return "/access/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login (AccessVO param, HttpSession hs, RedirectAttributes ra) {
		int result = service.login(param);
		
		if(result == Const.SUCCESS) {
			AccessVO vo = main_service.selLoginUserSeat(param.getU_no());
			if(vo != null) {
				param.setS_no(vo.getS_no());
				System.out.println("좌석 : "+vo.getS_no());
				param.setS_occupied(vo.getS_occupied());
				System.out.println("좌석 사용 여부 : "+vo.getS_occupied());
			}
			hs.setAttribute(Const.LOGIN_USER, param);
			return "redirect:/main/seat";
		}
		String msg = null;
		if(result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		} else if(result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}
		ra.addFlashAttribute("data", param); // 세션에 담겼다가 응답 후 지워진다.
		ra.addFlashAttribute("msg", msg);
		return "redirect:/access/login";
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
	public @ResponseBody String ajaxIdChk(@RequestBody AccessVO param) {
		System.out.println("u_id : " + param.getU_id());
		int result = service.login(param);
		System.out.println("result : " + result);
		return String.valueOf(result); // 값 자체를 응답
	}
}
