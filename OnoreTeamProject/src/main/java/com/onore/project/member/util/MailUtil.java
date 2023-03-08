package com.onore.project.member.util;

import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.service.MemberService;

public class MailUtil {
	
	@Autowired
	MemberService service;
	
	public void sendEmail(MemberDTO dto) {
	    
	    //Mail Server 설정
	    String charSet = "utf-8";
	    String hostSMTP  = "smtp.naver.com";
	    String hostSMTPid = ""; // 관리자 이메일 아이디
	    String hostSMTPpw = ""; // 관리자 이메일 비밀번호
	    
	    // 보내는 사람
	    String fromEmail = ""; // 보내는 사람 이메일
	    String fromName = ""; // 보내는 사람 이름
	    String subject = "[ONORE] 임시비밀번호 입니다."; // 메일 제목
	    String msg = "";
	    
	    msg += "<div align = 'left'>";
	    msg += "<h3>";
	    msg += dto.getMem_id() + "님의 임시 비밀번호 입니다. <br> 로그인 후 비밀번호를 변경해주세요. </h3>";
	    msg += "<p>임시 비밀번호:";
	    msg += dto.getMem_pw() + "</p></div>";
	    
	    // email 전송
	    String mailRecipient = dto.getMem_email(); // 받는 사람 이메일 주소
	    try {
	        // 객체 선언
	        HtmlEmail mail = new HtmlEmail();
	        mail.setDebug(true);
	        mail.setCharset(charSet);
	        mail.setSSLOnConnect(true);
	        mail.setHostName(hostSMTP);
	        mail.setSmtpPort(465);
	        mail.setAuthentication(hostSMTPid, hostSMTPpw);
	        mail.setStartTLSEnabled(true);
	        mail.addTo(mailRecipient, charSet);
	        mail.setFrom(fromEmail, fromName, charSet);
	        mail.setSubject(subject);
	        mail.setHtmlMsg(msg);
	        mail.send();
	        
	    } catch (EmailException e) {
	        e.printStackTrace();
	    }
	}
	
	public void findPw(HttpServletResponse response, MemberDTO dto) {
	}
}
