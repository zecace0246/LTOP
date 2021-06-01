package com.ltop.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.member.domain.AuthVO;
import com.ltop.app.member.domain.MemberVO;
import com.ltop.app.member.mapper.MemberMapper;
import com.ltop.app.member.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = { @Autowired })
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper;

    @Override
    public MemberVO selectMember(String userid) {
        return memberMapper.selectMember("");
    }

    @Override
    public List<MemberVO> selectMemberList(MemberVO memberVO) {
        return memberMapper.selectMemberList(memberVO);
    }

    @Override
    public MemberVO selectMemberInfo(MemberVO memberVO) {
        return memberMapper.selectMemberInfo(memberVO);
    }

    @Transactional
    @Override
    public int insertMember(MemberVO memberVO) {
        MemberVO checkMember = memberMapper.selectMemberInfo(memberVO);

        if (checkMember != null) {
            return 99;
        }

        memberVO.setUserPw(pwencoder.encode(memberVO.getUserPw()));

        int result = memberMapper.insertMember(memberVO);

        if (result > 0) {
            AuthVO authVO = new AuthVO();
            authVO.setUserId(memberVO.getUserId());
            authVO.setAuth("ROLE_MEMBER");

            memberMapper.insertMemberAuth(authVO);
        }

        return result;
    }

    @Transactional
    @Override
    public boolean updateMember(MemberVO memberVO) {

        memberVO.setUserPw(pwencoder.encode(memberVO.getUserPw()));

        return memberMapper.updateMember(memberVO) == 1;
    }

    @Transactional
    @Override
    public int deleteMember(MemberVO memberVO) {
        return memberMapper.deleteMember(memberVO) ;
    }

    @Transactional
    @Override
    public void insertMemberAuth(AuthVO authVO) {
        // TODO Auto-generated method stub
    }

    @Transactional
    @Override
    public void updateMemberAuth(AuthVO authVO) {
        // TODO Auto-generated method stub
    }

    @Transactional
    @Override
    public void deleteMemberAuth(AuthVO authVO) {
        // TODO Auto-generated method stub
    	memberMapper.deleteMemberAuth(authVO) ;
    }

    /**
     * ID 중복 체크 확인
     */
    @Override
    public int selectIdDupChk(MemberVO memberVO) {

        return memberMapper.selectIdDupChk(memberVO);
    }

    /** Moblie 사용자 정보 제공 */
    @Override
    public MemberVO getUserInfo(MemberVO memberVO) {

        return memberMapper.getUserInfo(memberVO);
    }

    /** Moblie 사용자 정보 수정 */
    @Override
    public int modifyUserInfo(MemberVO memberVO) {

        System.out.println("getUserPw :::>>> "+ memberVO.getUserPw());

        if( memberVO.getUserPw().equals("") || memberVO.getUserPw() == null ) {

        }else {

            memberVO.setUserPw(pwencoder.encode(memberVO.getUserPw()));
        }

        int result = memberMapper.updateMemberInfo(memberVO);

        return result;
    }

}
