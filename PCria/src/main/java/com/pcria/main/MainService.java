package com.pcria.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.access.model.AccessVO;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatDMI;
import com.pcria.main.model.SeatVO;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;
	
	public List<FoodVO> selFoodList(FoodVO param){
		List<FoodVO> list = null;
		if(param.getChk() >= 1 && param.getChk() <= 6) {
			list = mapper.selFoodList(param);
		//추천메뉴 로직 여기로 넣어줌
		}else {
			list = mapper.selFoodList(param);
		}
		return list;
	}
	public List<SeatVO> selSeat(){
		return mapper.selSeat();
	}
	public int insSeat(SeatDMI param) {
		return mapper.insSeat(param);
	}
	public int updSeat(SeatDMI param) {
		return mapper.updSeat(param);
	}
	public int delSeat(AccessVO param) {
		return mapper.delSeat(param);
	}
	public AccessVO selLoginUserSeat(int u_no) {
		return mapper.selLoginUserSeat(u_no);
	}
}
