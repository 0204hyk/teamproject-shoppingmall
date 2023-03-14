package com.onore.project.member.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.OrderDTO;
import com.onore.project.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

@Service
@Qualifier("memberservice")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper mapper;

	@Override
	public List<MemberDTO> getAll() {	
		return null;
	}

	// 회원가입
	@Override
	public Integer member_join(MemberDTO memberdto) throws Exception{
		return mapper.member_join(memberdto);
	}

	// 로그인
	@Override
	public MemberDTO signIn(MemberDTO dto) throws Exception {		
		return mapper.signIn(dto);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String mem_id) throws Exception {
		return mapper.idCheck(mem_id);
	}

	// 아이디 찾기
	@Override
	public String find_id(String name, String email) {
		String result = "";
		try {
		 result= mapper.find_id(name, email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result ;
	}


	/*
	// 비밀번호 찾기 -- 성공
	@Override
	public String find_pw(String id, String email) {
		String result = "";
		try {
		 result= mapper.find_pw(id, email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result ;
	}
	*/

	// 회원정보 상세페이지
	@Override
	public MemberDTO getMember(String memberId) throws Exception {
		return mapper.getMember(memberId);
	}

	// 회원정보 수정하기
	@Override
	public Integer memberInfoModify(MemberDTO memberdto) throws Exception {
		return mapper.memberInfoModify(memberdto);
	}


	// 비밀번호 수정
	@Override
	public Integer memberPwModify(MemberDTO memberdto) throws Exception {
		return mapper.memberPwModify(memberdto);
	}

	// 회원 탈퇴하기
	@Override
	public Integer memberDeleteDo(MemberDTO memberdto) throws Exception {
		return mapper.memberDeleteDo(memberdto);
	
	}

	// 회원이 소유한 쿠폰 조회	
	@Override
	public List<CouponDTO> getCoupons(String mem_id) {
		
		return mapper.getCoupons(mem_id);
	}
	// 적립금 할인 사용 후 적립금 차감
	@Override
	public Integer updatePoints(MemberDTO member) {
		
		return mapper.updatePoints(member);
	}
	
	@Override
	public Integer deleteCoupon(String coupon_name) {
		
		return mapper.deleteCoupon(coupon_name);
	}
	
	// 주문 완료 후 배송정보 수정
	@Override
	public Integer updateMemberAddress(MemberDTO member) {
			
		return mapper.updateMemberAddress(member);
	}

	// 비밀번호 변경 - 임시비밀번호 이메일로 보내기 --  실패
		@Override
		public void updatePwd(MemberDTO dto1) {
			return;
		}

		@Override
		public MemberDTO searchPwd(MemberDTO dto) {
			return mapper.searchPwd(dto);
		}
}
