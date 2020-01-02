package com.example.spring02.model.member.dao;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.member.dto.MemberVO;

@Repository // �쁽�옱 �겢�옒�뒪瑜� �뒪�봽留곸뿉�꽌 愿�由ы븯�뒗 dao bean�쑝濡� �벑濡�
public class MemberDAOImpl implements MemberDAO {
	// SqlSession 媛앹껜瑜� �뒪�봽�븨�뿉�꽌 �깮�꽦�븯�뿬 二쇱엯
	// �쓽議닿�怨� 二쇱엯(Dependency Injection), �뒓�뒯�븳 寃고빀
	@Inject
	SqlSession sqlSession; // mybatis �떎�뻾 媛앹껜
	
	
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("member.insertMember", vo);
	}
	
	@Override
	public boolean loginCheck(MemberVO vo) {
		String name = sqlSession.selectOne("member.loginCheck", vo);
		return (name == null) ? false : true;
	}
	
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return sqlSession.selectOne("member.viewMember", vo.getUserId());
	}
	
	@Override
	public void logout(HttpSession sessin) {
	}
	
	@Override
	public void deleteMember(MemberVO vo) {
		sqlSession.delete("member.deleteMember", vo);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("member.updateMember", vo);
	}
	
	@Override
	public boolean checkPw(String userId, String userPw) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count==1) result=true;
		return result;
		
	}
}
