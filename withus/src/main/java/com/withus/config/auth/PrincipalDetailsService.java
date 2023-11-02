package com.withus.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		MemberVo member = memberMapper.findById(memberId);
		if (member != null) {
			return new PrincipalDetails(member);
		}
		return null;
	}

}
