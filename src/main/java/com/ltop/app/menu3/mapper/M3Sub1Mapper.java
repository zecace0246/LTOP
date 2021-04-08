package com.ltop.app.menu3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.menu3.domain.M3Sub1VO;

@Mapper
public interface M3Sub1Mapper {

	public List<M3Sub1VO> selectUserList(M3Sub1VO m3Sub1VO);
	
}
