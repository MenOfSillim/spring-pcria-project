package com.pcria.counting;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.counting.model.CountingDMI;
import com.pcria.counting.model.CountingVO;

@Mapper
public interface CountingMapper {
	CountingDMI selFood(CountingDMI param);
	
	//시간 관련
	int updTime(CountingVO param);
	int discTime(CountingVO param);
	//보유 현금 관련
	int updWallet(CountingVO param);
	
	//음식 관련
	int payFood(CountingDMI param);
	int newFood(CountingDMI param);
	int addFood(CountingDMI param);
}
