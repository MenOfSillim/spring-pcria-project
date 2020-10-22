package com.pcria.counting;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.counting.model.CountingDMI;
import com.pcria.counting.model.CountingVO;

@Mapper
public interface CountingMapper {
	CountingDMI selFood(CountingDMI param);
	
	int updTime(CountingVO param);
	int updWallet(CountingVO param);
	int updFood(CountingDMI param);
	
	int newFood(CountingDMI param);
	int addFood(CountingDMI param);
}
