package com.dajung.dajungworld;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dajung.dajungworld.service.KakaoService;
import com.dajung.dajungworld.service.MemberMapper;


	@Controller
	public class KakaoController {

		@Autowired
		private KakaoService ks;
		@Autowired
		private MemberMapper memberMapper;
		
//		@Autowired
//		private HttpSession session;
		
		
		@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
		public String loginTest(HttpSession session,@RequestParam(value = "code", required = false) String code,HttpServletRequest req) throws Throwable {
		
			System.out.println("code:" + code);		
			String access_Token = ks.getAccessToken(code);
	    
			HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
			String hp = (String) userInfo.get("phone");				
			String gender = (String) userInfo.get("gender");
//			if(gender.equals("male")) {
//				gender="남성";
//			}else if(gender.equals("female")) {
//				gender="여성";
//			}
			userInfo.put("hp", hp);
			System.out.println("이거맞나? : " + hp);
		

			int count = memberMapper.checkJoin(userInfo);
			if(count == 0) {
				req.setAttribute("hp", hp);
				System.out.println("여기까지 : " + hp);
				req.setAttribute("name",userInfo.get("name"));	
				req.setAttribute("email",userInfo.get("email"));	
				req.setAttribute("gender",	gender);	
			
		
				return "world/world_join";
				
			}
			session.setAttribute("memInfo", userInfo.get("nickname"));
//			session.setAttribute("social", "kakao");
			req.setAttribute("msg", "로그인 하셨습니다");
			req.setAttribute("url", "world_main.do");
			
			
//			System.out.println("###access_Token#### : " + access_Token);	
//			System.out.println("###access_Token#### : " + access_Token);
//			System.out.println("###nickname#### : " + userInfo.get("nickname"));
//			System.out.println("###email#### : " + userInfo.get("email"));
//			System.out.println("###gender#### : " + userInfo.get("gender"));
//			System.out.println("###hp#### : " + userInfo.get("hp"));
//			System.out.println("###hpS#### : " + userInfo.get("hpS"));
//			System.out.println("###phone#### : " + userInfo.get("phone"));
//			System.out.println("어서와");
			return "message";
		}
	}
		
