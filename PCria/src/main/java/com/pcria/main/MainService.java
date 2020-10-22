package com.pcria.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.main.model.CountingDMI;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatVO;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;
	
	public List<FoodVO> selFoodList(FoodVO param){
		List<FoodVO> list = null;
		if(param.getChk() >= 1 && param.getChk() <= 6) {
			list = mapper.selFoodList(param);
		}else {
			list = mapper.selFoodList(param);
		}
		return list;
	}
	
	public List<SeatVO> selSeat(){
		return mapper.selSeat();
	}
	
	public int updFood(CountingDMI param) {
		int result = mapper.updFood(param);
		return result;
	}
}
