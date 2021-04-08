package com.ltop.app.menu5.service;

import java.util.List;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;

public interface M5Sub2Service {

	public int selectMatTotalCount(M5Sub2VO m5Sub2VO);
	
	public List<M5Sub2VO> selectMatList(PageVO pageVO, M5Sub2VO m5Sub2VO);

	public M5Sub2VO selectMatInfo(M5Sub2VO m5Sub2VO);
	
	public boolean insertMat(M5Sub2VO m5Sub2VO);
	
	public boolean updateMat(M5Sub2VO m5Sub2VO);
	
	public boolean deleteMat(M5Sub2VO m5Sub2VO);
	
}
