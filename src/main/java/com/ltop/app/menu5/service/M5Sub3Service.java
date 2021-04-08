package com.ltop.app.menu5.service;

import java.util.List;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub3VO;

public interface M5Sub3Service {

	public int selectAgencyTotalCount(M5Sub3VO m5Sub3VO);
	
	public List<M5Sub3VO> selectAgencyList(PageVO pageVO, M5Sub3VO m5Sub3VO);

	public M5Sub3VO selectAgencyInfo(M5Sub3VO m5Sub3VO);
	
	public boolean insertAgency(M5Sub3VO m5Sub3VO);
	
	public boolean updateAgency(M5Sub3VO m5Sub3VO);
	
	public boolean deleteAgency(M5Sub3VO m5Sub3VO);
	
	public List<M5Sub3VO> selectAgencyMathList(M5Sub3VO m5Sub3VO);
	
	public M5Sub3VO selectAgencyMathInfo(M5Sub3VO m5Sub3VO);
	
	public boolean insertAgencyMath(M5Sub3VO m5Sub3VO);
	
	public boolean updateAgencyMath(M5Sub3VO m5Sub3VO);
	
	public boolean deleteAgencyMath(M5Sub3VO m5Sub3VO);	
	
}
