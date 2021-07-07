package com.travel.model.member;

import java.util.List;
import java.util.Map;

import com.travel.model.payment.PaymentVO;

public interface MemberService {
	
	// ID 중복검사
	int checkID(MemberVO vo);
	
	// EMAIL 중복검사 
	int checkEmail(MemberVO vo);
	
	// 로그인시 회원 체크
	int checkMember(MemberVO vo);

	// 회원가입
	void insertMember(MemberVO vo);
	
	// 마이페이지
	// 회원 주문내역
	List<PaymentVO> getOrderList(MemberVO vo, int start, int end);
	// 회원 주문내역 갯수
	int getCountOrder(MemberVO vo);
	// 회원정보 수정
	void updateMember(MemberVO vo);
	void deleteMember(MemberVO vo);
	// 로그인
	MemberVO login(MemberVO vo);
	
	// 아이디 찾기 회원 확인
	int forgotIDChkMember(MemberVO vo);
	// 아이디 찾기
	MemberVO findID(MemberVO vo);
	
	// 비밀번호 발급 회원 확인
	int forgotPWChkMember(MemberVO vo);
	// 임시 비밀번호 발급
	int updatePwd(MemberVO vo);
	// 비밀번호 이메일 전송 처리
	String forgotPW(Map<String,Object> paramMap);
	
	// 회원 리스트
	List<MemberVO> getMemberList(int start, int end, MemberVO vo);
	int getCountMember(MemberVO vo);


}