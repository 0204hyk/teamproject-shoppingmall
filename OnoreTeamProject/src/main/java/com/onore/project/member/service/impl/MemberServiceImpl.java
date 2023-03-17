package com.onore.project.member.service.impl;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	   // 회원정보 상세페이지
	   @Override
	   public MemberDTO getMember(String memberId) throws Exception {
	      return mapper.getMember(memberId);
	   }

	   // 회원정보 수정하기
	   @Override
	   public void memberInfoModify(MemberDTO memberdto) throws Exception {
	      mapper.memberInfoModify(memberdto);
	   }

	   // 비밀번호 수정
	   @Override
	   public Integer memberPwModify(MemberDTO memberdto) throws Exception {
	      return mapper.memberPwModify(memberdto);
	   }
	   
	   // 이메일 전송
	   @Override
	   public void send_mail(MemberDTO member, String div) throws Exception {
	       // Mail Server 설정
	       String charSet = "utf-8";
	       String hostSMTP = "smtp.naver.com";
	       String hostSMTPid = "p_eunb@naver.com";
	       String hostSMTPpwd = "UWBD4H5121Y3";

	       // 보내는 사람 EMail, 이름, 제목, 내용
	       String fromEmail = "p_eunb@naver.com";
	       String fromName = "ONORE";
	       String subject = "";
	       String msg = "";

	       if(div.equals("find_pw")) {
	           // 랜덤 임시 비밀번호 생성
	           String pw = "";
	           for (int i = 0; i < 10; i++) { // 10자리로 수정
	               int random = (int) (Math.random() * 36);
	               pw += (char) (random < 10 ? '0' + random : 'a' + random - 10);
	           }
	           
	           // 필수 조건에 맞는지 확인 후 조건에 맞지 않으면 재생성
	           // 영소문자와 숫자가 필수로 섞여서 랜덤값이 생성되어야 함
	           while(!(pw.matches(".*[a-z].*") && pw.matches(".*[0-9].*"))) {
	               pw = "";
	               for (int i = 0; i < 10; i++) {
	                   int random = (int) (Math.random() * 36);
	                   pw += (char) (random < 10 ? '0' + random : 'a' + random - 10);
	               }
	           }
	           
	           member.setMem_pw(pw); // 생성된 임시 비밀번호를 DTO에 저장

	           // 비밀번호 암호화
	           BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	           String encodedPw = encoder.encode(pw);
	           member.setMem_pw(encodedPw);
	           // 비밀번호 암호화 끝

	           // 임시비밀번호를 DB에 업데이트
	           mapper.memberPwModify(member);

	           subject = "[ONORE] "+ member.getMem_id() +"님의 임시 비밀번호 입니다.";
	           msg += "안녕하세요, ONORE 고객님,<br>";
	           msg += "요청하신 임시 비밀번호는 다음과 같습니다.<br>";

	           msg += "<div style= 'border : solid 1px gray; text-align: center; '>";
	           msg += "· 회원 아이디 : " + member.getMem_id() + "<br>";
	           msg += "· 임시 비밀번호 : " + pw + "<br>";
	           msg += "</div>";
	       }
	       // 받는 사람 E-Mail 주소
	       String mail = member.getMem_email();

	       try {
	           Properties props = System.getProperties();
	           props.put("mail.smtp.host", hostSMTP);
	           props.put("mail.smtp.auth", "true");
	           props.put("mail.smtp.port", "587");

	           Session session = Session.getInstance(props, new Authenticator() {
	               protected PasswordAuthentication getPasswordAuthentication() {
	                   return new PasswordAuthentication(hostSMTPid, hostSMTPpwd);
	               }
	           });

	           MimeMessage message = new MimeMessage(session);
	           message.setFrom(new InternetAddress(fromEmail, fromName, charSet));
	           message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
	           message.setSubject(subject);
	           message.setContent(msg, "text/html;charset=utf-8");

	           Transport.send(message);
	           
	           System.out.println(mail + "로 메일발송 성공");
	       } catch (Exception e) {
	           e.printStackTrace();
	           System.out.println(mail + "로 메일발송 실패 : " + e);
	       }
	   }

	   // 비밀번호 찾기
	   @Override
	   public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception {
	       response.setContentType("text/html;charset=utf-8");
	       
	       // 아이디 존재여부 확인
	       MemberDTO search_member = mapper.getMember(member.getMem_id());
	       
	       // 아이디가 없으면
	       if (search_member == null) {
	          return;
	       }

	       // 이메일 존재여부 확인
	       if (!search_member.getMem_email().equals(member.getMem_email())) {
	          return;
	       }
	       
	    // 랜덤 임시 비밀번호 생성
	       String pw = "";
	       for (int i = 0; i < 12; i++) {
	           int random = (int) (Math.random() * 36); // 0 ~ 35 사이의 정수를 랜덤으로 생성
	           if (random < 10) {
	               pw += random; // 0 ~ 9 사이의 숫자는 그대로 추가
	           } else {
	               pw += (char) (random + 87); // 10 ~ 35 사이의 수는 영소문자로 변환하여 추가
	           }
	       }
	       member.setMem_pw(pw);

	       // 비밀번호 암호화
	       BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	       String encodedPw = encoder.encode(pw);
	       search_member.setMem_pw(encodedPw);
	       // 비밀번호 암호화 끝

	       // 임시비밀번호를 DB에 업데이트
	       mapper.memberPwModify(search_member);

	       // 임시비밀번호를 이메일로 전송하기
	       send_mail(search_member, "find_pw");

	       // 메일 전송 성공시 메세지와 함께 로그인창으로 바뀜(메세지는 member_login.jsp의 script에 있음) 
	       response.sendRedirect("./login?message=success"); 
	   }
	   
	   // 회원 탈퇴하기
	   //@Override
	   //public Integer memberDeleteDo(MemberDTO memberdto) throws Exception {
	   //   return mapper.memberDeleteDo(memberdto);
	    //}
	   

	   // 회원 탈퇴하기
	   @Override
	   public void memberDelete(MemberDTO memberdto) throws Exception {
	      mapper.memberDelete(memberdto);
	   }
	   
	   @Override
	   public Integer passChk(MemberDTO memberdto) throws Exception {
	      int result = mapper.passChk(memberdto);
	      return result;
	   }
	   
	   @Override
	   public List<OrderDTO> getMyOrders(HttpServletRequest req) {
		   
		   System.out.println((MemberDTO)req.getSession().getAttribute("signIn"));
		   MemberDTO member = (MemberDTO)req.getSession().getAttribute("signIn");
		   
		   return mapper.getMyOrders(member.getMem_id());
	   }   
	 
	@Override
	public Integer insertCoupon(CouponDTO coupon) {
		
		return mapper.insertCoupon(coupon);
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
}
