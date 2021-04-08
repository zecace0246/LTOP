package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub3VO;

public interface M5Sub3Mapper {

	public int selectAgencyTotalCount(M5Sub3VO m5Sub3VO);
	
	public List<M5Sub3VO> selectAgencyList(@Param("pageVO") PageVO pageVO, @Param("m5Sub3VO") M5Sub3VO m5Sub3VO);

	public M5Sub3VO selectAgencyInfo(M5Sub3VO m5Sub3VO);
	
	public int insertAgency(M5Sub3VO m5Sub3VO);
	
	public int updateAgency(M5Sub3VO m5Sub3VO);
	
	public int deleteAgency(M5Sub3VO m5Sub3VO);

	public List<M5Sub3VO> selectAgencyMathList(M5Sub3VO m5Sub3VO);
	
	public M5Sub3VO selectAgencyMathInfo(M5Sub3VO m5Sub3VO);
	
	public int insertAgencyMath(M5Sub3VO m5Sub3VO);
	
	public int updateAgencyMath(M5Sub3VO m5Sub3VO);
	
	public int deleteAgencyMath(M5Sub3VO m5Sub3VO);	
	
}
