package com.travel.model.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.model.member.MemberVO;
import com.travel.model.payment.PaymentVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 아이디 중복검사
	public int checkID(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkID", vo);
	}
	
	// 이메일 중복검사
	public int checkEmail(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkEmail", vo);
	}

	// 회원 존재 유무 검사
	public int checkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkMember", vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}
	// 회원정보 삭제
	public void deleteMember(MemberVO vo) {
		mybatis.delete("MemberDAO.deleteMember", vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", vo.getMember_id());
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("MemberDAO.orderMember", map);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.orderCount", vo);
	}
	
	// 아이디 찾기 회원체크
	public int forgotIDChkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.forgotIDChkMember", vo);
	}
		
	// 아이디 찾기 처리
	public MemberVO findID(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.forgotIDFound", vo);
	}
	
	// 비밀번호 발급 회원체크
	public int forgotPWChkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.forgotPWChkMember", vo);
	}
	// 임시 비밀번호 발급 처리
	public int updatePwd(MemberVO vo) {
		return mybatis.update("MemberDAO.updatePwd", vo);
	}
	// 비밀번호 이메일 전송 처리
	public String forgotPW(Map<String,Object>paramMap) {
		return mybatis.selectOne("MemberDAO.forgotPW",paramMap);
	}


	// 테스트용
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("member", vo);
		return mybatis.selectList("MemberDAO.getMemberList", map);
	}

	public int getCountMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getCountMember", vo);
	}
}
