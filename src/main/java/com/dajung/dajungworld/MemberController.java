package com.dajung.dajungworld;



import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dajung.dajungworld.dto.WorldMainDTO;
import com.dajung.dajungworld.dto.WorldMemberAllDTO;
import com.dajung.dajungworld.dto.WorldMemberDTO;
import com.dajung.dajungworld.dto.WorldTodayDTO;
import com.dajung.dajungworld.service.MemberMapper;
import com.dajung.dajungworld.service.WorldMapper;






	@Controller
	public class MemberController {

	//--------------------Autowired--------------------------

	@Autowired
	private JavaMailSender mailSender;	
		
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private WorldMapper worldMapper;
	
	@RequestMapping("/world_join.do")
	public String worldJoin() {
		
		return "world/world_join";
	}
	
	@RequestMapping(value = "/world_join_ok.do", method = RequestMethod.POST)
		public String joinMember(HttpServletRequest req, @ModelAttribute WorldMemberDTO dto) {
			
		int res = memberMapper.joinMember(dto);
		
		if(res>0) {
			
			req.setAttribute("msg","회원가입이 완료되었습니다.");
			req.setAttribute("url", "world_login.do");
		}else {
			
			req.setAttribute("msg","회원가입 실패 되었습니다.");
			req.setAttribute("url", "world_login.do");
			
		}			
		return"message";	
	}
	
	@GetMapping("/idUseCheck")

	public @ResponseBody int idUseCheck(String id) {
		int res = memberMapper.idUseCheck(id);

		return res;
	}


	// 회원 로그인 기능
	@RequestMapping("/world_login_ok.do")
	public ModelAndView world_login(HttpServletRequest req,HttpServletResponse response) throws ServletRequestBindingException  {
		HttpSession session = req.getSession();
		
		String id = req.getParameter("login_id");
		String password = req.getParameter("login_password");
		String id_check = req.getParameter("remember_userId");
		
		// 회원 체크
		int res = memberMapper.checkLogin(id, password);

		if (res == memberMapper.OK) {
			
			WorldMemberDTO dto = memberMapper.getWorldMemberById(id);
			int member_num = memberMapper.getMemberNum(dto);		
			List<WorldMemberAllDTO> list = memberMapper.listUpdateNews();
			WorldMemberAllDTO gdto = worldMapper.getMain(member_num);
			WorldTodayDTO tdto = new WorldTodayDTO();
			
			int setTotalCount = worldMapper.setTotalCount(tdto);
			int getTotalCount = worldMapper.getTotalCount();
			int getTodayCount = worldMapper.getTodayCount();
		
			int getListBoardCount = worldMapper.getListBoardCount();
			int getListPhotoCount = worldMapper.getListPhotoCount();
			int getListVisitCount = worldMapper.getListVisitCount();
					
			
//			
//			int board_num = ServletRequestUtils.getIntParameter(req, "board_num");
//			WorldMemberAllDTO getBoardNews = memberMapper.getBoardNews(board_num);
//			session.setAttribute("getBoardNews", board_num);
			
			session.setAttribute("listUpdateNews", list);
			
			
			session.setAttribute("memId", dto);
			session.setAttribute("getMain", gdto);
//			session.setAttribute("getUpdateNews", dto2);
			
			//today
			session.setAttribute("setTotalCount", setTotalCount);
			session.setAttribute("getTotalCount", getTotalCount);
			session.setAttribute("getTodayCount", getTodayCount);
	
			//updateNews
			session.setAttribute("getListBoardCount", getListBoardCount);
			session.setAttribute("getListVisitCount", getListVisitCount);
			session.setAttribute("getListPhotoCount", getListPhotoCount);
			
			System.out.println("고유번호 : " + member_num);
			System.out.println("아이디: " + id);
					
			//아이디 저장
			Cookie ck = new Cookie("id_check", dto.getId());
			if(id_check != null) {
				ck.setMaxAge(24*60*60);
				
			}else {
				ck.setMaxAge(0);
				
			}
			response.addCookie(ck);
			
			
			
			return new ModelAndView("redirect:world_main.do");
			
		} else if (res == memberMapper.NOT_ID || res == memberMapper.NOT_PW) {
			req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		} else if (res == memberMapper.ERROR) {
			req.setAttribute("msg", "진행이 원활하지 않습니다, 잠시 후에 다시 이용해주세요.");
		}
		
		req.setAttribute("url", "world_login.do");
		return new ModelAndView("forward:/WEB-INF/views/message.jsp");
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/world_find_id.do")
	public String finddId(HttpServletRequest req, String name, String email, String hp, String radio_option) {
		String mode = (String) req.getAttribute("mode");

		if (mode == null) {
			mode = "find_id";
			req.setAttribute("mode", "find_id");
		}

		return "world/world_find_id";
	}
	
	// 비밀번호 찾기 페이지
		@RequestMapping("/world_find_pw.do")
		public String finddpw(HttpServletRequest req) {
			String mode = (String) req.getAttribute("mode");
			if (mode == null) {
				mode = "find_pw";
				req.setAttribute("mode", "find_pw");
			}

			return "world/world_find_id";
		}


	// 아이디 찾기 기능
	@RequestMapping(value = "/world_find_id_complete.do", method = RequestMethod.POST)
	public String findId(@RequestParam Map<String, String> map, HttpServletRequest req) {

		WorldMemberDTO dto = new WorldMemberDTO();
		String userId = null;
		if (map.get("mode").equals("find_id")) {
			if (map.get("radio_option").equals("hp")) {
				String hp = (String) map.get("hp");
				System.out.println(hp);
				String name = (String) map.get("name");
				dto.setHp(hp);
				dto.setName(name);
				userId = memberMapper.findIdHp(dto);
				System.out.println(userId);
			}
			if (map.get("radio_option").equals("email")) {
				dto.setName(map.get("name"));
				dto.setEmail(map.get("email"));
				userId = memberMapper.findIdEmail(dto);
				System.out.println(userId);
			}
			req.setAttribute("userId", userId);
			return "world/world_find_id_complete";
		}
		if(map.get("mode").equals("find_pw")) {

			int res = memberMapper.findPw(map);
			
			if (res == 1) {
				char[] str = {'!','@','#','$','%','^','&','*','-','?'};	
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}		
				for(int i =0; i<4;i++) {
					char s = str[(int) ((Math.random()*9))];
					pw +=s;
				}
				
			
				map.put("password",pw);
				int rs = memberMapper.resetPw(map);
				 /* 이메일 보내기 */
		        String setFrom = "wjs9276@naver.com";
		        String toMail = map.get("email");
		        String title = "비밀번호 찾기 인증 이메일 입니다.";
		        String content = 
		                "홈페이지를 방문해주셔서 감사합니다." +
		                "<br><br>" + 
		                "임시비밀번호는 " + pw + "입니다." + 
		                "<br>" + 
		                "해당 비밀번호를 비밀번호 입력창에 기입하여 주세요.";
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		        
		        
				req.setAttribute("userPw", pw);

			}
			return "world/world_find_pw_complete";
		}

		return "world/world_find_id_complete";
	}
	
	
	// 회원 로그아웃 기능
	@RequestMapping("/world_logout.do")
	public String world_logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
//		String mode = (String) session.getAttribute("social");
//		if(mode != null) {
//			
//			// kakao 계정으로 로그아웃 할 경우
//			if(mode.equals("kakao")) {
//				req.setAttribute("msg", "카카오계정이 정상적으로 로그아웃 되었습니다.");
//				req.setAttribute("url", "https://accounts.kakao.com/logout?continue=https%3A%2F%2Fcs.kakao.com%2F");
//				
//				session.invalidate();
//				
//				return "kakaoMessage";	// 세션 종료후 메인화면으로 넘어가기위해 별도의 kakaoMessage.jsp 만들어놓음.
//			}
//		}
		
		session.invalidate();
		
		req.setAttribute("msg", "정상적으로 로그아웃됐습니다.");
		req.setAttribute("url", "world_login.do");

		return "message";
	}
	
	
}	
