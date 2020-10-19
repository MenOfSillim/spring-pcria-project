package com.pcria.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.main.model.FoodVO;

@Mapper
public interface MainMapper {
	
	List<FoodVO> selFoodList(FoodVO param);
}
