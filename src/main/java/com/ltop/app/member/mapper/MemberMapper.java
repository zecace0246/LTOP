package com.ltop.app.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.member.domain.AuthVO;
import com.ltop.app.member.domain.MemberVO;

@Mapper
public interface MemberMapper {

	public MemberVO selectMember(String userid);

	public MemberVO selectMemberInfo(MemberVO memberVO);

	public List<MemberVO> selectMemberList(MemberVO memberVO);

	public int insertMember(MemberVO memberVO);

	public int updateMember(MemberVO memberVO);

	public int deleteMember(MemberVO memberVO);

	public void insertMemberAuth(AuthVO authVO);

	public void updateMemberAuth(AuthVO authVO);

	public void deleteMemberAuth(AuthVO authVO);

	public int selectIdDupChk(MemberVO memberVO);

}
