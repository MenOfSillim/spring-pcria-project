package com.pcria.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.access.model.AccessDMI;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatDMI;
import com.pcria.main.model.SeatVO;

@Mapper
public interface MainMapper {
	List<FoodVO> selFoodList(FoodVO param);
	
	//좌석 관련
	List<SeatVO> selSeat();
	int insSeat(SeatDMI param);
	int updSeat(SeatDMI param);
	int delSeat(AccessDMI param);
}
