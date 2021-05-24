package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub1VO;

@Mapper
public interface M5Sub1Mapper {

    public List<M5Sub1VO> selectUserList(@Param("pageVO") PageVO pageVO, @Param("m5Sub1VO") M5Sub1VO m5Sub1VO);

    public M5Sub1VO selectUserInfo(String userId);

    public int insertUser(M5Sub1VO m5Sub1VO);

    public int updateUser(M5Sub1VO m5Sub1VO);

    public int deleteUser(M5Sub1VO m5Sub1VO);

    public void insertUserAuth(M5Sub1VO m5Sub1VO);

    public int deleteUserAuth(M5Sub1VO m5Sub1VO);

    public int selectUserTotalCount(M5Sub1VO m5Sub1VO);

	public M5Sub1VO selectUserAlarmInfo(M5Sub1VO vo);

	public List<M5Sub1VO> selectUserAlarmList(String userId);

	public int insertUserAlarm(M5Sub1VO m5Sub1VO);

	public String selectUserAuth(M5Sub1VO m5Sub1VO);

	public void updateUserAuth(M5Sub1VO m5Sub1VO);

}
