package com.travel.view.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.home.Pager;
import com.travel.model.member.Email;
import com.travel.model.member.MemberService;
import com.travel.model.member.MemberVO;
import com.travel.model.member.impl.EmailSender;
import com.travel.model.payment.PaymentVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("/term")
	public String term(MemberVO vo) {
		return "member/term";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) {
		return "member/join";
	}
	
	@RequestMapping("/forgotPW")
	public String forgotPWView(MemberVO vo) {
		return "member/forgotPW";
	}
	
	@RequestMapping("/qna")
	public String helpView(MemberVO vo) {
		return "board/help";
	}

	@RequestMapping("/forgotID")
	public String forgotIDView(MemberVO vo) {
		return "member/forgotID";
	}

	// 아이디*비밀번호 찾기 화면
	@RequestMapping(value = "/findIdPwd")
	public String findView(MemberVO vo) {
		return "member/findIdPwd";
	}

	// 마이페이지
	@ResponseBody
	@RequestMapping("/mypL")
	public String mypage1(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		// 주문 테이블 갯수 계산
		int count = memberService.getCountOrder(vo);

		session.setAttribute("myp", myp);
		session.setAttribute("member_id", vo.getMember_id());

		// 페이지 관련 설정
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}

	// 마이페이지 뷰(페이징 처리)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageView(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		int count = memberService.getCountOrder(vo);
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}
	
	// 마이페이지-회원정보
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypage2(MemberVO vo, HttpSession session) {
		memberService.login(vo);
		return "member/mypage2";
	}
	
	// 마이페이지-회원정보수정 처리
	@RequestMapping(value = "/mypageinfo", method = RequestMethod.POST)
	public String mypageInfo(MemberVO vo, HttpSession session) {
		memberService.updateMember(vo);
		session.invalidate();
		return "member/login";
	}
	
	
	// 마이페이지-회원탈퇴
	@RequestMapping(value = "/deleteMyp", method = RequestMethod.POST)
	public String deleteMyp(MemberVO vo, HttpSession session) {
		memberService.deleteMember(vo);
		session.invalidate();
		return "main";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkID")
	public int checkID(MemberVO vo) {
		int checkID = memberService.checkID(vo);
		return checkID;
	}
	
	// 이메일 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkEmail")
	public int checkEmail(MemberVO vo) {
		int checkEmail = memberService.checkEmail(vo);
		return checkEmail;
	}

	// 회원가입 시 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkMember")
	public int checkMember(MemberVO vo) {
		int checkMember = memberService.checkMember(vo);
		return checkMember;
	}

	// 회원가입
	@RequestMapping("/signUp")
	public String signUp(MemberVO vo) {
		memberService.insertMember(vo);
		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		return "member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO member = memberService.login(vo);
		if (member != null) {
			session.setAttribute("member", member);
			return "main";
		} else {
			return "member/login";
		}
	}

	// 아이디 찾기 회원 확인
	@ResponseBody
	@RequestMapping(value = "/forgotIDChkm")
	public int findMemberId(MemberVO vo) {
		int forgotIDChkMember = memberService.forgotIDChkMember(vo);
		return forgotIDChkMember;
	}

	// 아이디 찾기 처리
	@RequestMapping(value = "/forgotID", method = RequestMethod.POST)
	public String findId(MemberVO vo, HttpSession session) {
		MemberVO findId = memberService.findID(vo);
		session.setAttribute("findId", findId);
		return "foundId";
	}

	// 아이디 찾기 화면
	@RequestMapping(value = "/foundId", method = RequestMethod.GET)
	public String foundId(MemberVO vo) {
		return "member/foundId";
	}

	// 비밀번호 찾기 회원 확인
	@ResponseBody
	@RequestMapping(value = "/forgotPWChkm")
	public int forgotPWChkm(MemberVO vo) {
		int forgotPWChkm = memberService.forgotPWChkMember(vo);
		return forgotPWChkm;
	}

	// 비밀번호 이메일 전송처리
	@RequestMapping(value="/forgotPW", method = {RequestMethod.POST})
	public String forgotPW(@RequestParam Map<String,Object> paramMap, ModelMap model, MemberVO vo) throws Exception {
		String id=(String) paramMap.get("member_id");
		String e_mail=(String) paramMap.get("member_email");
		// 임시 비밀번호 생성
		String pw= "";
		for (int i = 0; i < 7; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		vo.setMember_pwd(pw);
		memberService.updatePwd(vo);
		email.setContent(id+" 님의 임시 비밀번호는 "+pw+" 입니다.");
		email.setReceiver(e_mail);
		email.setSubject("안녕하세요 "+id+" 님 00투어 임시 비밀번호 안내 메일입니다.");
		emailSender.SendEmail(email);
		return "member/login";
	}
}
