package com.pcria.counting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.counting.model.CountingDMI;
import com.pcria.counting.model.CountingVO;

@Service
public class CountingService {

	@Autowired
	private CountingMapper mapper;
	
	public int selFood(CountingDMI param) {
		CountingDMI dbFood = mapper.selFood(param);
		if(dbFood == null) { // 해당 음식 시킨적 없음 - insert
			return 0;
		} // 해당 음식 시킨적 있음 - update
		return 1;  
	}
	
	// 시간 구매
	public int updTime(CountingVO param) {
		return mapper.updTime(param);
	}
	
	// 잔액 충전
	public int updWallet(CountingVO param) {
		return mapper.updWallet(param);
	}

	// 음식 구매
	public int updFood(CountingDMI param) {
		int result = mapper.updFood(param);
		return result;
	}
	
	// 처음 시키는 음식
	public int newFood(CountingDMI param) {
		return mapper.newFood(param);
	}
	
	// 늘 먹던 음식
	public int addFood(CountingDMI param) {
		return mapper.addFood(param);
	}
}
