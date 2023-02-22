package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
public class NoticeDTO {
	private Integer notice_num;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	public String getCreationDateTime() {		
		LocalDate creationDate = LocalDate.ofInstant(notice_date.toInstant(), ZoneId.systemDefault());
		LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
		
		return creationDate.isEqual(today) ? 
				timeFormat.format(notice_date) : dayFormat.format(notice_date);		
	}

}
