package com.example.spring02.model.member.dao;

import javax.servlet.http.HttpSession;
import com.example.spring02.model.member.dto.MemberVO;


public interface MemberDAO {
	public void insertMember(MemberVO vo);
	
	public boolean loginCheck(MemberVO vo);
	
	public MemberVO viewMember(MemberVO vo);
	
	public void logout(HttpSession session);
	
	public void deleteMember(MemberVO vo);
	
	public void updateMember(MemberVO vo);
	
	public boolean checkPw(String userId, String userPw);
}