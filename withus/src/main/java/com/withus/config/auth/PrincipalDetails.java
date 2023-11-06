package com.withus.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.withus.domain.MemberVo;

public class PrincipalDetails implements UserDetails, OAuth2User {

	private MemberVo member;
	private Map<String, Object> attributes;
	
	// 일반 로그인
	public PrincipalDetails(MemberVo member) {
		this.member = member;
	}
	
	// OAuth2 로그인
	public PrincipalDetails(MemberVo member, Map<String, Object> attributes) {
		this.member = member;
		this.attributes = attributes;
	}
	
	// 해당 User의 권한을 리턴하는 메서드
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		
		collect.add(new GrantedAuthority() {
			@Override
			public String getAuthority() {
				return member.getRole();
			}
		});
		return collect;
	}

	@Override
	public String getPassword() {
		return member.getPassword();
	}

	@Override
	public String getUsername() {
		return member.getMemberId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public String getName() {
		return (String)attributes.get("sub");
	}

}
