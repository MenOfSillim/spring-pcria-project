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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pcria.Const;
import com.pcria.SecurityUtils;
import com.pcria.access.AccessService;
import com.pcria.access.model.AccessVO;
import com.pcria.counting.model.CountingVO;
import com.pcria.main.model.CountingDMI;
import com.pcria.main.model.FoodVO;

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
	public @ResponseBody int foodAjax(@RequestBody CountingDMI param, HttpServletRequest req, RedirectAttributes ra) {
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
		int u_no = SecurityUtils.getLoginUserPk(req);
		AccessVO vo = new AccessVO();
		vo.setU_no(u_no);
		vo = accService.userInfo(vo, req);
		
		String msg = "";
		if(vo.getU_wallet() < param.getTotalPayment()) {
			msg = "잔액이 부족합니다";
			ra.addAttribute("msg", msg);
			return 2;
		}
		param.setU_no(u_no);
		int result = service.updFood(param);
		
		return result;
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
