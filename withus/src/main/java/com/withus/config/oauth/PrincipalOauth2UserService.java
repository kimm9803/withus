package com.withus.config.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.withus.config.auth.PrincipalDetails;
import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{

	@Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberMapper memberMapper;
	
	// 구글 로그인 후처리 함수
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		
		String provider = userRequest.getClientRegistration().getRegistrationId();	// google
		String providerId = oauth2User.getAttribute("sub");
		String memberId = provider + "_" + providerId;	// google_113892990175733960828
		String password = passwordEncoder.encode("겟인데어");
		String name = oauth2User.getAttribute("name");
		String gender = oauth2User.getAttribute("gender");
		String role = "ROLE_USER";
		
		// 성별을 못 받아왔을 시 default 값 지정
		if (gender == null) {
			gender = "select";
		}
		MemberVo findMember = memberMapper.findById(memberId);
		
		if (findMember == null) {
			MemberVo member = new MemberVo();
			member.setMemberId(memberId);
			member.setPassword(password);
			member.setName(name);
			member.setGender(gender);
			member.setRole(role);
			memberMapper.join(member);
			return new PrincipalDetails(member, oauth2User.getAttributes());
		} else {
			return new PrincipalDetails(findMember, oauth2User.getAttributes());
		}
		
		
	}
}
