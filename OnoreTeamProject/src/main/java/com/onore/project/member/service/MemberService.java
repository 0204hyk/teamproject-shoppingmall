package com.onore.project.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.QnaDTO;


public interface MemberService {
	
public List<MemberDTO> getAll();
	
	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;
	
	// 로그인
	MemberDTO signIn(MemberDTO dto) throws Exception;
	
	// 아이디 중복체크
	int idCheck(String mem_id) throws Exception;
	
	// 아이디 찾기
	String find_id(String name, String email);
	
	// 비밀번호 찾기 - 이메일 전송
	void send_mail(MemberDTO member, String temporaryPassword) throws Exception;
	
	// 비밀번호 찾기 - 비밀번호 찾기
	void find_pw(HttpServletResponse response, MemberDTO member) throws Exception;
		
	// 회원정보 불러오기
	MemberDTO getMember(String memberId) throws Exception;
	
	// 회원정보 수정하기
	void memberInfoModify(MemberDTO memberdto) throws Exception;
	
	// 비밀번호 수정하기
	Integer memberPwModify(MemberDTO memberdto) throws Exception;
	
	// 회원탈퇴 하기
	// Integer memberDeleteDo(MemberDTO memberdto) throws Exception;
	void memberDelete(MemberDTO memberdto) throws Exception;
	
	Integer passChk(MemberDTO memberdto) throws Exception;
	 
	// 가입시 쿠폰 지급
	Integer insertCoupon(CouponDTO coupon);
	
	// 회원이 소유한 쿠폰 가져오기
	List<CouponDTO> getCoupons(String mem_id);
	
	// 회원이 사용한 쿠폰 제거
	Integer deleteCoupon(String coupon_name);
	
	// 적립금 할인 사용 후 적립금 차감
	Integer updatePoints(MemberDTO member);
	
	// 주문완료 후 배송지 수정
	Integer updateMemberAddress(MemberDTO member);
	
	List<QnaDTO> getQnaView(String mem_id, HttpServletRequest req);
}

