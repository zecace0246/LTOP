package com.ltop.app.menu5.service;

import java.util.List;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub4VO;

public interface M5Sub4Service {

	public int selectAlarmPropertyTotalCount(M5Sub4VO m5Sub4VO);
	
	public List<M5Sub4VO> selectAlarmPropertyList(PageVO pageVO, M5Sub4VO m5Sub4VO);

	public M5Sub4VO selectAlarmPropertyInfo(M5Sub4VO m5Sub4VO);
	
	public boolean insertAlarmProperty(M5Sub4VO m5Sub4VO);
	
	public boolean updateAlarmProperty(M5Sub4VO m5Sub4VO);
	
	public boolean deleteAlarmProperty(M5Sub4VO m5Sub4VO);
	
}
