package com.onore.project.qna.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UploadVO {
	private String nmae;
	private MultipartFile file;
}
