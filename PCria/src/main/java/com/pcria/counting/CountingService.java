package com.pcria.counting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.counting.model.CountingVO;

@Service
public class CountingService {

	@Autowired
	private CountingMapper mapper;
	
	public int updTime(CountingVO param) {
		return mapper.updTime(param);
	}
	
	public int updWallet(CountingVO param) {
		return mapper.updWallet(param);
	}
}
