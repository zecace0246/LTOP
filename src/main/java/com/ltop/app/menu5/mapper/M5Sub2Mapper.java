package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;

public interface M5Sub2Mapper {

	public int selectMatTotalCount(M5Sub2VO m5Sub2VO);
	
	public List<M5Sub2VO> selectMatList(@Param("pageVO") PageVO pageVO, @Param("m5Sub2VO") M5Sub2VO m5Sub2VO);

	public M5Sub2VO selectMatInfo(M5Sub2VO m5Sub2VO);
	
	public int insertMat(M5Sub2VO m5Sub2VO);
	
	public int updateMat(M5Sub2VO m5Sub2VO);
	
	public int deleteMat(M5Sub2VO m5Sub2VO);
	
}
