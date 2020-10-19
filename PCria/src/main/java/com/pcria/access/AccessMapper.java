package com.pcria.access;

import org.apache.ibatis.annotations.Mapper;

import com.pcria.access.model.AccessVO;

@Mapper
public interface AccessMapper {
	public AccessVO selUser(AccessVO param);
	public int insUser(AccessVO param);
}
