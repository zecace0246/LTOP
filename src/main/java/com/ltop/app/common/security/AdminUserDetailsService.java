package com.ltop.app.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ltop.app.common.security.domain.CustomUser;
import com.ltop.app.member.domain.MemberVO;
import com.ltop.app.member.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class AdminUserDetailsService implements UserDetailsService {

    @Setter(onMethod_ = { @Autowired })
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        MemberVO paramVO = new MemberVO();

        paramVO.setUserId(username);

        MemberVO vo = memberMapper.selectMemberInfo(paramVO);

        return vo == null ? null : new CustomUser(vo);
    }

}
