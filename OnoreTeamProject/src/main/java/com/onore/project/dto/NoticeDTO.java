package com.onore.project.dto;

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
}
