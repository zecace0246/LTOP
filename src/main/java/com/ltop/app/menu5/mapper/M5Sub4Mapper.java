package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub4VO;

public interface M5Sub4Mapper {

	public int selectAlarmPropertyTotalCount(M5Sub4VO m5Sub4VO);
	
	public List<M5Sub4VO> selectAlarmPropertyList(@Param("pageVO") PageVO pageVO, @Param("m5Sub4VO") M5Sub4VO m5Sub4VO);

	public M5Sub4VO selectAlarmPropertyInfo(M5Sub4VO m5Sub4VO);
	
	public int insertAlarmProperty(M5Sub4VO m5Sub4VO);
	
	public int updateAlarmProperty(M5Sub4VO m5Sub4VO);
	
	public int deleteAlarmProperty(M5Sub4VO m5Sub4VO);
	
}
