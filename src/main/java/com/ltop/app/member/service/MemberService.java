package com.ltop.app.member.service;

import java.util.List;

import com.ltop.app.member.domain.AuthVO;
import com.ltop.app.member.domain.MemberVO;

public interface MemberService {

	public MemberVO selectMember(String userid);
	
	public MemberVO selectMemberInfo(MemberVO memberVO);
	
	public List<MemberVO> selectMemberList(MemberVO memberVO);
	
	public int insertMember(MemberVO memberVO);
	
	public boolean updateMember(MemberVO memberVO);
	
	public boolean deleteMember(MemberVO memberVO);
	
	public void insertMemberAuth(AuthVO authVO);
	
	public void updateMemberAuth(AuthVO authVO);
	
	public void deleteMemberAuth(AuthVO authVO);
	
}
