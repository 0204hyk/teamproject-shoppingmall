package com.onore.project.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.member.dto.Member;
import com.onore.project.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;
	
	@GetMapping("/")
		public String main() {
		
		return "user/main/onore";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	@GetMapping("/member_search")
	public String member_Search() {
		return "user/login/member_search";
	}
	
	
	@GetMapping("/join")
	public String join() {
		return "user/join/member_join";
	}
	
	@GetMapping("/member")
	public void members(Model model) {
		
		String sql = "SELECT * FROM members";
		
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		){
			List<Member> members = new ArrayList<>();

			while(rs.next()) {
				members.add(new Member(
						rs.getString("mem_id"),
						rs.getString("mem_pw"),
						rs.getString("mem_email"),
						rs.getString("mem_phone"),
						rs.getString("mem_name"),
						rs.getInt("mem_zip_code"),
						rs.getString("mem_street_address"),
						rs.getString("mem_detail_address"),
						rs.getString("mem_gender"),
						rs.getDate("mem_birth_date"),
						rs.getDate("mem_register_date"),
						rs.getInt("mem_point"),
						rs.getInt("mem_sms")
						));
			}

			model.addAttribute("members", members);

		} catch (SQLException e) {

			e.printStackTrace();
		}	
	}
	
	// Mybatis로 하나만 SELECT
	@GetMapping("/mypage")
			public String getMember(Model model, Integer mem_id) {
		model.addAttribute("mem_id", mapper.get(mem_id));
		return "user/join/member_mypage";
	}
	
	@GetMapping("/member/add")
	public String addMember(Model model, Member member) {
		int row = mapper.add(member);
		return "redirect:/user/main/onore";
		
	}
	
}
