package com.ltop.app.menu5.service;

import java.util.List;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub5VO;

public interface M5Sub5Service {

	public int selectGroupTotalCount(M5Sub5VO m5Sub5VO);

	public List<M5Sub5VO> selectGroupList(PageVO pageVO, M5Sub5VO m5Sub5VO);

	public M5Sub5VO selectGroupInfo(M5Sub5VO m5Sub5VO);

	public boolean insertGroup(M5Sub5VO m5Sub5VO);

	public boolean updateGroup(M5Sub5VO m5Sub5VO);

	public boolean deleteGroup(M5Sub5VO m5Sub5VO);

}
