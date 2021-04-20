package com.ltop.app.menu5.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub5VO;
import com.ltop.app.menu5.mapper.M5Sub5Mapper;
import com.ltop.app.menu5.service.M5Sub5Service;

import lombok.Setter;

@Service
public class M5Sub5ServiceImpl implements M5Sub5Service {

	@Setter(onMethod_ = @Autowired)
	private M5Sub5Mapper m5Sub5Mapper;


	@Override
	public int selectGroupTotalCount(M5Sub5VO m5Sub5VO) {
		return m5Sub5Mapper.selectGroupTotalCount(m5Sub5VO);
	}

	@Override
	public List<M5Sub5VO> selectGroupList(PageVO pageVO, M5Sub5VO m5Sub5VO) {
		return m5Sub5Mapper.selectGroupList(pageVO, m5Sub5VO);
	}

	@Override
	public M5Sub5VO selectGroupInfo(M5Sub5VO m5Sub5VO) {
		return m5Sub5Mapper.selectGroupInfo(m5Sub5VO);
	}

	@Transactional
	@Override
	public boolean insertGroup(M5Sub5VO m5Sub5VO) {
		M5Sub5VO GroupInfo = m5Sub5Mapper.selectGroupInfo(m5Sub5VO);

		if (GroupInfo != null) {
			return false;
		}

		int result = m5Sub5Mapper.insertGroup(m5Sub5VO);

		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateGroup(M5Sub5VO m5Sub5VO) {
		return m5Sub5Mapper.updateGroup(m5Sub5VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteGroup(M5Sub5VO m5Sub3VO) {
		int result = m5Sub5Mapper.deleteGroup(m5Sub3VO);

		return result > 0;
	}


}
