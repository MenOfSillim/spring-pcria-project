package com.pcria.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.counting.model.CountingDMI;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatVO;

@Mapper
public interface MainMapper {
	
	List<FoodVO> selFoodList(FoodVO param);
	List<SeatVO> selSeat();
	
}
