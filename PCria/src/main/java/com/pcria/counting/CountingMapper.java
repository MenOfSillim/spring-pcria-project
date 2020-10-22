package com.pcria.counting;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.counting.model.CountingVO;

@Mapper
public interface CountingMapper {
	int updTime(CountingVO param);
	int updWallet(CountingVO param);
}
