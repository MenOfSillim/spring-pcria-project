package com.pcria.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.pcria.Const;
import com.pcria.SecurityUtils;
import com.pcria.access.AccessService;
import com.pcria.access.model.AccessVO;
import com.pcria.counting.model.CountingDMI;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatDMI;import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private AccessService accService;
	
	@RequestMapping(value = "/seat", method = RequestMethod.GET)
	public String seat(Model model) {
		
		model.addAttribute(Const.MENU_ID, "seat");
		model.addAttribute(Const.VIEW, "main/seat");
		model.addAttribute(Const.CSS, "main/seat");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/usageTime", method = RequestMethod.GET)
	public String usageTime(Model model, HttpServletRequest req, AccessVO param) {
		
		model.addAttribute("data", accService.userInfo(param, req));
		model.addAttribute(Const.MENU_ID, "usageTime");
		model.addAttribute(Const.VIEW, "main/usageTime");
		model.addAttribute(Const.CSS, "main/usageTime");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String food(Model model) {
		
		model.addAttribute(Const.MENU_ID, "foodOrder");
		model.addAttribute(Const.FOOD_MENU_ID, "chk_8");
		model.addAttribute(Const.VIEW, "main/food");
		model.addAttribute(Const.CSS, "main/food");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/foodAjax", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody List<FoodVO> foodAjax(FoodVO param, HttpSession hs) {
		return service.selFoodList(param);
	}
	
	@RequestMapping(value = "/ajaxSelSeat", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public @ResponseBody SeatDMI ajaxSelSeat(HttpSession hs) {
		SeatDMI seatDMI = new SeatDMI();
		int u_no = SecurityUtils.getLoginUserPk(hs);
		seatDMI.setAjaxSelSeat(service.selSeat());
		//내가 예약한 좌석값 가져오기
		for (int i = 0; i < seatDMI.getAjaxSelSeat().size(); i++) {
			if(seatDMI.getAjaxSelSeat().get(i).getU_no() == u_no) {
				seatDMI.setMyS_no(seatDMI.getAjaxSelSeat().get(i).getS_no());
				seatDMI.setMyS_occupied(seatDMI.getAjaxSelSeat().get(i).getS_occupied());
				seatDMI.setMyS_val(seatDMI.getAjaxSelSeat().get(i).getS_val());
			}
		}
		return seatDMI;
	}
	@RequestMapping(value = "/ajaxUpdSeat", method = RequestMethod.POST)
	public @ResponseBody int ajaxUpdSeat(@RequestBody SeatDMI param, HttpSession hs) {
		param.setU_no(SecurityUtils.getLoginUserPk(hs));
		//로그인 세션에 넣기 
		AccessVO loginUser = SecurityUtils.getLoginUser(hs);
		loginUser.setS_occupied(param.getS_occupied());
		loginUser.setS_no(param.getS_no());
		if(param.getMyUpdInsChk() == 1) {
			loginUser.setMyUpdInsChk(1);
			service.updSeat(param);
			return 2;
		}else if(param.getMyUpdInsChk() == 0){
			service.insSeat(param);
			loginUser.setMyUpdInsChk(1);
			return 1;
		}else {
			return 3;
		}
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		
		model.addAttribute(Const.MENU_ID, "profile");
		model.addAttribute(Const.VIEW, "main/profile");
		model.addAttribute(Const.CSS, "main/profile");
		
		return "/template/mainTemplate";
	}
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profile(MultipartHttpServletRequest mreq, AccessVO param ,HttpSession hs, RedirectAttributes ra) {
		System.out.println(param.getU_name());
		int result = service.updProfile(mreq, param, hs);
		System.out.println("result : "+result);
		ra.addFlashAttribute("result", result);
		return "redirect:/main/profile";

	}
}
