package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub5VO;

public interface M5Sub5Mapper {

	public int selectGroupTotalCount(M5Sub5VO m5Sub5VO);

	public List<M5Sub5VO> selectGroupList(@Param("pageVO") PageVO pageVO, @Param("m5Sub5VO") M5Sub5VO m5Sub5VO);

	public M5Sub5VO selectGroupInfo(M5Sub5VO m5Sub5VO);

	public int insertGroup(M5Sub5VO m5Sub5VO);

	public int updateGroup(M5Sub5VO m5Sub5VO);

	public int deleteGroup(M5Sub5VO m5Sub3VO);


}
