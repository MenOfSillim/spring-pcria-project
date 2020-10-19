package com.pcria.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.main.model.FoodVO;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;
	
	public List<FoodVO> selFoodList(FoodVO param){
		List<FoodVO> list = mapper.selFoodList(param);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getF_name());
		}
		return list;
	}
}
