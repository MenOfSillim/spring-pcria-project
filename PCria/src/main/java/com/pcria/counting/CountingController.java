package com.pcria.counting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pcria.SecurityUtils;
import com.pcria.access.AccessService;
import com.pcria.access.model.AccessVO;
import com.pcria.counting.model.CountingVO;

@Controller
@RequestMapping("/count")
public class CountingController {

	@Autowired
	private CountingService couService;
	
	@Autowired
	private AccessService accService;
	
	@RequestMapping(value = "/time", method = RequestMethod.POST)
	public String time(CountingVO param, HttpServletRequest req, RedirectAttributes ra) {
		param.setU_no(SecurityUtils.getLoginUserPk(req));
		
		AccessVO vo = new AccessVO();
		vo = accService.userInfo(param, req);
		
		if(vo.getU_wallet() < param.getU_wallet()) {
			String msg = "";
			msg = "잔액이 부족합니다.";
			ra.addFlashAttribute("msg", msg);
			return "redirect:/main/usageTime";
		}
		
		int result = couService.updTime(param);
		return "redirect:/main/usageTime";
	}
	@RequestMapping(value = "/coinAjax", method = RequestMethod.POST)
	public @ResponseBody AccessVO coinAjax(@RequestBody CountingVO param, HttpServletRequest req) {
		System.out.println("요청 금액 : " + param.getU_wallet());
		int u_no = SecurityUtils.getLoginUserPk(req);
		param.setU_no(u_no);
		int result = couService.updWallet(param);
		System.out.println("결과 : " + result);
		AccessVO vo = new AccessVO();
		vo = accService.userInfo(param, req);
		return vo;
	}
	
}
