package com.ltop.app.menu5.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub3VO;
import com.ltop.app.menu5.mapper.M5Sub3Mapper;
import com.ltop.app.menu5.service.M5Sub3Service;

import lombok.Setter;

@Service
public class M5Sub3ServiceImpl implements M5Sub3Service {

	@Setter(onMethod_ = @Autowired)
	private M5Sub3Mapper m5Sub3Mapper;
	
	
	@Override
	public int selectAgencyTotalCount(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.selectAgencyTotalCount(m5Sub3VO);
	}	
	
	@Override
	public List<M5Sub3VO> selectAgencyList(PageVO pageVO, M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.selectAgencyList(pageVO, m5Sub3VO);
	}

	@Override
	public M5Sub3VO selectAgencyInfo(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.selectAgencyInfo(m5Sub3VO);
	}
	
	@Transactional
	@Override
	public boolean insertAgency(M5Sub3VO m5Sub3VO) {
		M5Sub3VO AgencyInfo = m5Sub3Mapper.selectAgencyInfo(m5Sub3VO);
		
		if (AgencyInfo != null) {
			return false;
		}
		
		int result = m5Sub3Mapper.insertAgency(m5Sub3VO);
				
		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateAgency(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.updateAgency(m5Sub3VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteAgency(M5Sub3VO m5Sub3VO) {
		int result = m5Sub3Mapper.deleteAgency(m5Sub3VO);
		
		if (result > 0) {
			m5Sub3Mapper.deleteAgencyMath(m5Sub3VO);
		}
		
		return result > 0;
	}

	@Override
	public List<M5Sub3VO> selectAgencyMathList(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.selectAgencyMathList(m5Sub3VO);
	}	
	
	@Override
	public M5Sub3VO selectAgencyMathInfo(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.selectAgencyMathInfo(m5Sub3VO);
	}	
	
	@Transactional
	@Override
	public boolean insertAgencyMath(M5Sub3VO m5Sub3VO) {
		M5Sub3VO AgencyMathInfo = m5Sub3Mapper.selectAgencyMathInfo(m5Sub3VO);
		
		if (AgencyMathInfo != null) {
			return false;
		}
		
		int result = m5Sub3Mapper.insertAgencyMath(m5Sub3VO);
				
		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateAgencyMath(M5Sub3VO m5Sub3VO) {
		return m5Sub3Mapper.updateAgencyMath(m5Sub3VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteAgencyMath(M5Sub3VO m5Sub3VO) {
		int result = m5Sub3Mapper.deleteAgencyMath(m5Sub3VO);
		
		return result > 0;
	}
	
}
