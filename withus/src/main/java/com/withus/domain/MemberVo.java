package com.withus.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVo {
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	@Pattern(regexp = "^[a-zA-Z0-9]{4,12}$", message = "4자 이상 12자 이하의 영문자 또는 숫자로 이루어져야 합니다.")
	private String memberId;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
    message = "비밀번호는 영문 대&소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String password;
	
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String name;
	
	private String sex;
	
	private String role;
	
	private String regDate;
	
	private String provider;
	private String providerId;
}
