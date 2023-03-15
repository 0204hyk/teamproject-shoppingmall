package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	
	private Integer comment_num;
	private Integer review_num;
    private String comment_id;
    private String comment_content;
    private Date comment_date;
    
	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    public String getCreationCommentDate() {		
    	LocalDate creationDate = LocalDate.ofInstant(comment_date.toInstant(), ZoneId.systemDefault());
	    LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
	    return creationDate.isEqual(today) ? 
		 	   timeFormat.format(comment_date) : dayFormat.format(comment_date);		
    }
}
