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

import com.pcria.Const;
import com.pcria.SecurityUtils;
import com.pcria.access.AccessService;
import com.pcria.access.model.AccessDMI;
import com.pcria.access.model.AccessVO;
import com.pcria.main.model.CountingDMI;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatDMI;

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
	@RequestMapping(value = "/foodAjax", method = RequestMethod.POST)
	public @ResponseBody int foodAjax(@RequestBody CountingDMI param) {
		System.out.println("총 계산 금액 : "+param.getTotalPayment());
		System.out.println("요청 사항 : "+param.getFood_request());
		for (int j = 0; j < param.getCountingList().size(); j++) {
			System.out.print("seq : "+param.getCountingList().get(j).getSeq()+",");
			System.out.print("i_f : "+param.getCountingList().get(j).getI_f()+",");
			System.out.print("f_name : "+param.getCountingList().get(j).getF_name()+",");
			System.out.print("total_quantity : "+param.getCountingList().get(j).getTotal_quantity()+",");
			System.out.print("total_price : "+param.getCountingList().get(j).getTotal_price());
			System.out.println();
		}
		return 1;
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
		System.out.println("ajaxUpdSeat 왔음");
		System.out.println("s_no(선택 좌석) : "+param.getS_no());
		System.out.println("로그인 유저 정보 : "+SecurityUtils.getLoginUserPk(hs));
		System.out.println("s_occupied : "+param.getS_occupied());
		System.out.println("myUpdInsChk : "+param.getMyUpdInsChk());
		param.setU_no(SecurityUtils.getLoginUserPk(hs));
		//로그인 세션에 넣기 
		AccessDMI loginUser = (AccessDMI) hs.getAttribute(Const.LOGIN_USER);
		loginUser.setS_occupied(param.getMyS_occupied());
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
