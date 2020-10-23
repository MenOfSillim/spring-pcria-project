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
import com.pcria.counting.model.CountingDMI;
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
	
	@RequestMapping(value = "/foodAjax", method = RequestMethod.POST)
	public @ResponseBody int foodAjax(@RequestBody CountingDMI param, HttpServletRequest req, RedirectAttributes ra) {
		System.out.println("총 계산 금액 : "+param.getTotalPayment());
		System.out.println("요청 사항 : "+param.getFood_request());
		
		int u_no = SecurityUtils.getLoginUserPk(req);
		AccessVO vo = new AccessVO();
		vo.setU_no(u_no);
		vo = accService.userInfo(vo, req);
		
		for (int j = 0; j < param.getCountingList().size(); j++) {
			param.getCountingList().get(j).setU_no(u_no);
			System.out.print("seq : "+param.getCountingList().get(j).getSeq()+",");
			System.out.print("i_f : "+param.getCountingList().get(j).getI_f()+",");
			System.out.print("f_name : "+param.getCountingList().get(j).getF_name()+",");
			System.out.print("total_quantity : "+param.getCountingList().get(j).getTotal_quantity()+",");
			System.out.print("total_price : "+param.getCountingList().get(j).getTotal_price());
			System.out.println();
			
			String msg = "";
			if(vo.getU_wallet() < param.getTotalPayment()) {
				msg = "잔액이 부족합니다";
				ra.addAttribute("msg", msg);
				return 2;
			}
			
			int result = couService.selFood(param.getCountingList().get(j));
			if(result == 0) {
				couService.newFood(param.getCountingList().get(j));
			} else if(result == 1) {
				couService.addFood(param.getCountingList().get(j));
			}
		}
		
		param.setU_no(u_no);
		int result = couService.updFood(param);
		
		return result;
	}
}
