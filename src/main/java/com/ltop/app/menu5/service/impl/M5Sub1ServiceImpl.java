package com.ltop.app.menu5.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.member.domain.MemberVO;
import com.ltop.app.menu5.domain.M5Sub1VO;
import com.ltop.app.menu5.mapper.M5Sub1Mapper;
import com.ltop.app.menu5.service.M5Sub1Service;

import lombok.Setter;

@Service
public class M5Sub1ServiceImpl implements M5Sub1Service {

    private static final Logger logger = LoggerFactory.getLogger(M5Sub1ServiceImpl.class);

    @Setter(onMethod_ = { @Autowired })
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private M5Sub1Mapper m5Sub1Mapper;

    @Override
    public int selectUserTotalCount(M5Sub1VO m5Sub1VO) {

       return m5Sub1Mapper.selectUserTotalCount(m5Sub1VO);
    }

    @Override
    public List<M5Sub1VO> selectUserList(PageVO pageVO, M5Sub1VO m5Sub1VO) {
        return m5Sub1Mapper.selectUserList(pageVO, m5Sub1VO);
    }

    @Override
    public M5Sub1VO selectUserInfo(String userId) {
        return m5Sub1Mapper.selectUserInfo(userId);
    }

    @Transactional
    @Override
    public boolean insertUser(M5Sub1VO m5Sub1VO){
        M5Sub1VO checkUser = m5Sub1Mapper.selectUserInfo(m5Sub1VO.getUserId());

        if (checkUser != null) {
            return false;
        }

        System.out.println("checkUser ::> "+ checkUser);

        /*
         * 사용자 등록 User id / 로그인 한 사용자 User Id
         */
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;
        String username = ((UserDetails) principal).getUsername();

        m5Sub1VO.setUserPw(pwencoder.encode(m5Sub1VO.getUserPw()));
        m5Sub1VO.setReguserId(username);

        int result = m5Sub1Mapper.insertUser(m5Sub1VO);

        if (result > 0) {
            m5Sub1VO.setAuth("ROLE_USER");

            m5Sub1Mapper.insertUserAuth(m5Sub1VO);
        }

        return result > 0;
    }

    @Transactional
    @Override
    public boolean updateUser(M5Sub1VO m5Sub1VO) {

        if(m5Sub1VO.getUserPw() != null || !m5Sub1VO.getUserPw().equals("")) {
            m5Sub1VO.setUserPw(pwencoder.encode(m5Sub1VO.getUserPw()));
        }

        return m5Sub1Mapper.updateUser(m5Sub1VO) == 1;
    }

    @Transactional
    @Override
    public boolean deleteUser(M5Sub1VO m5Sub1VO) {
        int result = m5Sub1Mapper.deleteUserAuth(m5Sub1VO);

        if (result > 0) {
            m5Sub1Mapper.deleteUser(m5Sub1VO);
        }

        return result > 0;
    }

	@Override
	public M5Sub1VO selectUserAlarmInfo(String userId, int seq) {

		System.out.println(" serviceImpl seq :::> " + seq);

		M5Sub1VO vo = new M5Sub1VO();

		vo.setUserId(userId);
		vo.setSeq(seq);

		return m5Sub1Mapper.selectUserAlarmInfo(vo);
	}

	@Override
	public List<M5Sub1VO> selectUserAlarmList(String userId) {
		return m5Sub1Mapper.selectUserAlarmList(userId);
	}

	@Transactional
	@Override
	public int insertUserAlarm(M5Sub1VO m5Sub1VO) {

		int result = m5Sub1Mapper.insertUserAlarm(m5Sub1VO);

		return result;
	}

}
