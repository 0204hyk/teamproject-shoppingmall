package com.onore.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface MemberMapper {

	public List<MemberDTO> getAll();

	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;

	// 로그인
	MemberDTO signIn(MemberDTO dto) throws Exception;

	// 아이디 중복체크
	int idCheck(String mem_id) throws Exception;

	// 아이디 찾기
	String find_id(@Param("mem_name") String name, @Param("mem_email") String email);

	// 비밀번호 찾기
	String find_pw(@Param("mem_id") String id, @Param("mem_email") String email);
	void update_pw(MemberDTO member) throws Exception;

	// 회원정보 불러오기
	MemberDTO getMember(String memberId) throws Exception;

	// 회원정보 수정하기
	void memberInfoModify(MemberDTO memberdto) throws Exception;

	// 비밀번호 수정하기
	Integer memberPwModify(MemberDTO memberdto) throws Exception;

	// 회원탈퇴 하기
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

	// 마이페이지 문의글 가져오기
	List<QnaDTO> getQnaView(String mem_id);
	
	// 마이페이지 문의글 팝업 내용
	List<QnaDTO> getQnaViewAll(String mem_id);
	
	// 마이페이지 리뷰 가져오기
	List<ReviewandProductDTO> getReview(String mem_id);
	
	// 마이페이지 리뷰글 팝업 내용
	List<ReviewandProductDTO> getReviewAll(String mem_id);
}

