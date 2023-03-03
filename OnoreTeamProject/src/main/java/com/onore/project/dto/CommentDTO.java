package com.onore.project.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CommentDTO {
	
	private Integer comment_num;
	private Integer review_num;
    private String comment_id;
    private String comment_content;
    private LocalDate comment_date;
    
    // id마스킹처리 ex) ${review.maskingName}
 	public String getmaskingName() {

 		String firstName = comment_id.substring(0,1);
 		String midName = comment_id.substring(1, comment_id.length() - 1);

 		String masking = "";
 		for(int i = 0; i < midName.length(); ++i) {
 			masking += "*";
 		}

 		String lastName = comment_id.substring(comment_id.length() - 1, comment_id.length());

 		String maskingName = firstName + masking + lastName;

 		return maskingName;
 	}
}
