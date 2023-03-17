package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class QnaReplyDTO {

	private Integer reply_num;
	private Integer qna_num;
	private String reply_content;
	private Date reply_date;

	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    public String getCreationReplyDate() {
    	LocalDate creationDate = LocalDate.ofInstant(reply_date.toInstant(), ZoneId.systemDefault());
	    LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
	    return creationDate.isEqual(today) ?
		 	   timeFormat.format(reply_date) : dayFormat.format(reply_date);
    }

}