package com.dajung.dajungworld;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dajung.dajungworld.dto.WorldBoardDTO;
import com.dajung.dajungworld.dto.WorldFamilyDTO;
import com.dajung.dajungworld.dto.WorldMemberAllDTO;
import com.dajung.dajungworld.dto.WorldMemberDTO;
import com.dajung.dajungworld.dto.WorldPhotoDTO;
import com.dajung.dajungworld.dto.WorldPhotoImgDTO;
import com.dajung.dajungworld.dto.WorldReplyDTO;
import com.dajung.dajungworld.dto.WorldVisitDTO;
import com.dajung.dajungworld.service.MemberMapper;
import com.dajung.dajungworld.service.WorldMapper;


	@Controller
	public class WorldController {

	@Autowired
	private WorldMapper worldMapper;
	@Autowired
	private MemberMapper memberMapper;
	

	@RequestMapping("/world_login.do")
		public String worldLogin() {
		
		return "world/world_login";
		}

	@RequestMapping("/world_main.do")
	public String worldMain(){
		
	    
		return "world/world_main";
	}
	
	@RequestMapping("/diary_main.do")
	public String diaryMain() {
	
	return "world/world_diary";
	}
	
	@RequestMapping("/world_memberList.do")
	public ModelAndView memberList() {
		
		List<WorldMemberDTO> mlist = memberMapper.listMember();
		return new ModelAndView("world/world_memberList","listMember", mlist);
	}
	
	@RequestMapping("/board_main.do")
		public ModelAndView boardMain(HttpServletRequest req) throws ServletRequestBindingException {
		String id = req.getParameter("id");
		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
	    int member_num = memberMapper.getMemberNum(memDTO);

			
		List<WorldMemberAllDTO> list = worldMapper.listBoard(member_num);
	
		
		return new ModelAndView("world/world_board","listBoard", list);
		
	}
	
	
	@RequestMapping("/photo_main.do")	
	public ModelAndView photoMain(HttpServletRequest req) {
		
		String id = req.getParameter("id");
		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
	    int member_num = memberMapper.getMemberNum(memDTO);
		List<WorldMemberAllDTO> list = worldMapper.listPhoto(member_num);
		return new ModelAndView("world/world_photo","listPhoto", list);
	
	}
	
	
	@RequestMapping("/visit_main.do")	
	public ModelAndView visitMain(HttpServletRequest req) throws ServletRequestBindingException {

		String id = req.getParameter("id");
		int main_num = ServletRequestUtils.getIntParameter(req, "main_num");
		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
	    int member_num = memberMapper.getMemberNum(memDTO);
	    
		List<WorldMemberAllDTO> list = worldMapper.listVisit(member_num);
		
	return new ModelAndView("world/world_visit","listVisit", list);
	
	}
	
//	@RequestMapping(value = "/world_insertMain.do" , method = RequestMethod.GET)
//	public String insertMain(HttpServletRequest req,@ModelAttribute WorldMemberDTO dto) throws ServletRequestBindingException  {
//		
//		
//		int main_num = ServletRequestUtils.getIntParameter(req, "main_num");
//		
//		return "world/world_insertMain";
//	}
	

//	
//	@RequestMapping(value = "/world_insertMain.do" , method = RequestMethod.POST)
//	public String insertMainOk(HttpServletRequest req, @ModelAttribute WorldMDTO dto,  BindingResult result ) throws IOException{
//		
//		
//		String id = req.getParameter("id");
//		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
//		int member_num = memberMapper.getMemberNum(memDTO);
//		
//		
//		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;		
//		MultipartFile mf = mr.getFile("main_image1");
//		String main_image1 = mf.getOriginalFilename();
//					
//		if(result.hasErrors()) {
//			dto.setMain_image1(main_image1);
//		}
//		dto.setMember_num(member_num);
//		int res = worldMapper.insertMain(dto);
//		
//		HttpSession session = req.getSession();
//		String upPath = session.getServletContext().getRealPath("/resources/images");
//	
//		File file = new File(upPath, main_image1);
//		if (mf.getSize() != 0) {
//			if (!file.exists())
//				file.mkdirs();
//			try {
//				mf.transferTo(file);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		if(res>0) {
//		
//			req.setAttribute("msg", "메인 정보가 등록되었습니다. 다시 로그인 해주세요.");
//			req.setAttribute("url", "world_login.do");
//			
//		}else {
//			req.setAttribute("msg", "메인 정보수정이 실패 하였습니다..");
//			req.setAttribute("url", "world_insertMain.do");
//		}
//		
//		return "message";
//		
//		
//	}
//	
	
	@RequestMapping(value = "/world_editMain.do", method = RequestMethod.GET)
	public String editMain(HttpServletRequest req) throws ServletRequestBindingException {

		
		int main_num = ServletRequestUtils.getIntParameter(req, "main_num");
		
		return "world/world_editMain";
	}
	
	@RequestMapping(value = "/world_editMain.do", method = RequestMethod.POST)
	public String editMainOk(HttpServletRequest req, @ModelAttribute WorldMemberDTO dto,BindingResult result) throws IllegalStateException, IOException {
	

		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		String upPath = req.getServletContext().getRealPath("/resources/images");
		MultipartFile mf = mr.getFile("main_image1");
		String main_image1 = mf.getOriginalFilename();
		if(!main_image1.trim().equals("")) {
				HttpSession session = req.getSession();
				upPath = (String)session.getAttribute("upPath");
				File file = new File(upPath, main_image1);
				mf.transferTo(file);
				dto.setMain_image1(main_image1);
				
		}else {
			dto.setMain_image1(req.getParameter("main_image2"));
		}	
		int res = worldMapper.updateMain(dto);
		if(res>0) {
			
			req.setAttribute("msg", "수정이 정상적으로 완료되었습니다. 다시 로그인해주세요.");
			req.setAttribute("url", "world_login.do");
			
		}else {
			
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "world_editMain.do");
		}
	
		return "message";
	
	}	
	
	
	@RequestMapping(value = "/world_insertPhoto.do", method = RequestMethod.GET)
		public String insertPhoto() {		
		
		return "world/world_insertPhoto";
		
	}
	
	@RequestMapping(value = "world_insertPhoto.do" , method = RequestMethod.POST)
		public String insertPhoto(HttpServletRequest req, @ModelAttribute WorldPhotoDTO dto,MultipartFile mf) {
		
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = (Iterator<String>) mr.getFileNames();
		String upPath = req.getServletContext().getRealPath("/resources/images");
		
		String id = req.getParameter("id");
		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
		int member_num = memberMapper.getMemberNum(memDTO);
		
		dto.setMember_num(member_num);

		
		WorldPhotoImgDTO imgDTO = new WorldPhotoImgDTO();
		
		int res = worldMapper.insertPhoto(dto);
		int photo_num = worldMapper.getPhotoNum(dto);
		System.out.println("사진번호 : " + photo_num);
		
		if(res > 0) {
			imgDTO.setPhoto_num(photo_num);
			while (it.hasNext()) {
				String img = it.next();
				mf = mr.getFile(img);
				String photo_image = mf.getOriginalFilename();
				File file = new File(upPath, photo_image);
				if (mf.getSize() != 0) {
					if (!file.exists())
						file.mkdirs();
					try {
						mf.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
				System.out.println(photo_image);
				if (photo_image == null || photo_image.equals("")) {
					break;
				}
				// 사진 순서대로 넣기
				if (imgDTO.getPhoto_image1() == null || imgDTO.getPhoto_image1().equals("")) {
					imgDTO.setPhoto_image1(photo_image);
				} else if (imgDTO.getPhoto_image2() == null || imgDTO.getPhoto_image2().equals("")) {
					imgDTO.setPhoto_image2(photo_image);
				} else if (imgDTO.getPhoto_image3() == null || imgDTO.getPhoto_image3().equals("")) {
					imgDTO.setPhoto_image3(photo_image);
				} else if (imgDTO.getPhoto_image4() == null || imgDTO.getPhoto_image4().equals("")) {
					imgDTO.setPhoto_image4(photo_image);
				} else if (imgDTO.getPhoto_image5() == null || imgDTO.getPhoto_image5().equals("")) {
					imgDTO.setPhoto_image5(photo_image);
				}	

				
				//이미지 없는거에 "" 값 정해주기
				if (imgDTO.getPhoto_image2() == null || imgDTO.getPhoto_image2().equals("")) {
					imgDTO.setPhoto_image2("");
				}
				if (imgDTO.getPhoto_image3() == null || imgDTO.getPhoto_image3().equals("")) {
					imgDTO.setPhoto_image3("");
				}
				if (imgDTO.getPhoto_image4() == null || imgDTO.getPhoto_image4().equals("")) {
					imgDTO.setPhoto_image4("");
				}
				if (imgDTO.getPhoto_image5() == null || imgDTO.getPhoto_image5().equals("")) {
					imgDTO.setPhoto_image5("");
				}

			}
		
			int res2 = worldMapper.insertPhotoImg(imgDTO);
			req.setAttribute("msg", "사진이 등록되었습니다.");
			req.setAttribute("url", "photo_main.do?member_num="+dto.getMember_num()+"&id="+memDTO.getId());
			
		} else {
			req.setAttribute("msg", "사진 등록 실패");
			req.setAttribute("url", "world_insertPhoto.do");
		}
		
		return "message";
	}
			
			
	@RequestMapping(value = "/world_editPhoto.do",method = RequestMethod.GET)
	public String editPhoto(HttpServletRequest req) throws ServletRequestBindingException{
		
		
		
		
		int photo_num = ServletRequestUtils.getIntParameter(req, "photo_num");
		WorldMemberAllDTO dto = worldMapper.getPhoto(photo_num);
				
		List<String> list = new ArrayList<>();
		list.add(dto.getPhoto_image1());
	
		if(dto.getPhoto_image2() != null) {
			if(!dto.getPhoto_image2().equals("")) {
				list.add(dto.getPhoto_image2());
			}
		}
		if(dto.getPhoto_image3() != null) {
			if(!dto.getPhoto_image3().equals("")) {
				list.add(dto.getPhoto_image3());
			}
		}
		if(dto.getPhoto_image4() != null) {
			if(!dto.getPhoto_image4().equals("")) {
				list.add(dto.getPhoto_image4());
			}
		}
		if(dto.getPhoto_image5() != null) {
			if(!dto.getPhoto_image5().equals("")) {
				list.add(dto.getPhoto_image5());
			}
		}
	
		
		req.setAttribute("getPhoto", dto);
		req.setAttribute("imageList", list);	
		
		return "/world/world_editPhoto";					
	}
	
	@RequestMapping(value = "/world_editPhoto.do", method = RequestMethod.POST)
	public ModelAndView admin_prod_viewUpdate(HttpServletRequest req,
												@ModelAttribute WorldPhotoDTO dto,
												@ModelAttribute WorldPhotoImgDTO imgDTO) throws IllegalStateException, IOException {
		System.out.println("요까지");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = (Iterator<String>) mr.getFileNames();
		
		String upPath = req.getServletContext().getRealPath("/resources/images/");
		
		ModelAndView mav = new ModelAndView("message");
		 		
		while (it.hasNext()) {
			String img = it.next();
			MultipartFile mf = mr.getFile(img);			
			String photo_image = mf.getOriginalFilename();
			File file = new File(upPath, photo_image);
			if (mf.getSize() != 0) {
				if (!file.exists())
					file.mkdirs();
				try {
					mf.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			System.out.println(photo_image);
			if (photo_image == null || photo_image.equals("")) {
				break;
			}
			// 사진 순서대로 넣기
			if (imgDTO.getPhoto_image1() == null || imgDTO.getPhoto_image1().equals("")) {
				imgDTO.setPhoto_image1(photo_image);
			} else if (imgDTO.getPhoto_image2() == null || imgDTO.getPhoto_image2().equals("")) {
				imgDTO.setPhoto_image2(photo_image);
			} else if (imgDTO.getPhoto_image3() == null || imgDTO.getPhoto_image3().equals("")) {
				imgDTO.setPhoto_image3(photo_image);
			} else if (imgDTO.getPhoto_image4() == null || imgDTO.getPhoto_image4().equals("")) {
				imgDTO.setPhoto_image4(photo_image);
			} else if (imgDTO.getPhoto_image5() == null || imgDTO.getPhoto_image5().equals("")) {
				imgDTO.setPhoto_image5(photo_image);
			}
		}
		
		if(imgDTO.getPhoto_image1() == null || imgDTO.getPhoto_image1().equals("")) {
			if	(imgDTO.getPhoto_image2() != null) {
				imgDTO.setPhoto_image1(imgDTO.getPhoto_image2());
				imgDTO.setPhoto_image2("");
			}	
			if	(imgDTO.getPhoto_image3() != null) {
				imgDTO.setPhoto_image1(imgDTO.getPhoto_image3());
				imgDTO.setPhoto_image3("");
			}
			if	(imgDTO.getPhoto_image4() != null) {
				imgDTO.setPhoto_image1(imgDTO.getPhoto_image4());
				imgDTO.setPhoto_image4("");
			}
			if	(imgDTO.getPhoto_image5() != null) {
				imgDTO.setPhoto_image1(imgDTO.getPhoto_image5());
				imgDTO.setPhoto_image5("");
			}

		}
		
		if (imgDTO.getPhoto_image2() == null || imgDTO.getPhoto_image2().equals("")) {
			imgDTO.setPhoto_image2("");
		}
		if (imgDTO.getPhoto_image3() == null || imgDTO.getPhoto_image3().equals("")) {
			imgDTO.setPhoto_image3("");
		}
		if (imgDTO.getPhoto_image4() == null || imgDTO.getPhoto_image4().equals("")) {
			imgDTO.setPhoto_image4("");
		}
		if (imgDTO.getPhoto_image5() == null || imgDTO.getPhoto_image5().equals("")) {
			imgDTO.setPhoto_image5("");
		}

		
		int res = worldMapper.updatePhotoImage(imgDTO);
		System.out.println(res);
		if(res == 0) {
			req.setAttribute("msg", "이미지 수정 실패!");
			req.setAttribute("url", "world_editPhoto.do?photo_num="+dto.getPhoto_num());
			
		}else{			
			req.setAttribute("msg", "이미지 수정 성공");	
			req.setAttribute("url", "photo_main.do");
		}
		
		int photo_res = worldMapper.updatePhoto(dto);
		System.out.println("들왔니" + photo_res);
		if(photo_res==0) {
			req.setAttribute("msg", "사진 수정 실패");
			req.setAttribute("url", "world_editPhoto.do?photo_num="+dto.getPhoto_num());
			
		}else {
			req.setAttribute("msg", "사진 수정 성공");
			req.setAttribute("url", "photo_main.do");
		}
		
		return mav;
	}
	
	
	
	@RequestMapping("/world_deletePhoto.do")
	public String deletePhoto(HttpServletRequest req,@ModelAttribute WorldPhotoDTO dto) throws ServletRequestBindingException{
		
		int photo_num = ServletRequestUtils.getIntParameter(req, "photo_num");
		
//		String id = req.getParameter("id");
//		WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
//		int member_num = memberMapper.getMemberNum(memDTO);
		
		int res = worldMapper.deletePhoto(photo_num);
		WorldPhotoImgDTO imgDTO = new WorldPhotoImgDTO();
		
		if(res>0) {
			
			worldMapper.deletePhotoImg(photo_num);		
			req.setAttribute("msg", "해당 사진을 삭제하였습니다.");
			req.setAttribute("url", "world_main.do");
			
		}else {
			
			req.setAttribute("msg", "사진 삭제 실패하였습니다.");
			req.setAttribute("url", "photo_main.do");
			
		}
		return "message";
	}
	
	
	@RequestMapping("/world_photo_view.do")
	public String photoView(HttpServletRequest req) throws ServletRequestBindingException {
		
		int photo_num = ServletRequestUtils.getIntParameter(req, "photo_num");
		
		WorldMemberAllDTO getPhoto = worldMapper.getPhoto(photo_num);
		
		req.setAttribute("getPhoto", getPhoto);
		
		return "world/world_photoContent";
		
		
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/world_insertBoard.do" ,method = RequestMethod.GET)
	public String insertBoard() {
		
		return "world/world_insertBoard";
		
		
	}
	
	@RequestMapping(value ="/world_insertBoard.do", method = RequestMethod.POST)
	public String insertBoardOK(HttpServletRequest req,@ModelAttribute WorldBoardDTO dto) {
		
		 String id = req.getParameter("id");		 
		 WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
//		int member_num = 41;
		int member_num = memberMapper.getMemberNum(memDTO);
		dto.setMember_num(member_num);
		
		int res = worldMapper.insertBoard(dto);
		
		if(res>0) {
			
			req.setAttribute("msg", "게시글이 등록되었습니다.");
			req.setAttribute("url","board_main.do?member_num="+dto.getMember_num()+"&id="+memDTO.getId());
			
		}else {
			
			req.setAttribute("msg", "게시글 등록 실패.");
			req.setAttribute("url",	 "world_insertBoard.do");
			
		}
						
		return "message";
	}
	
	 @PostMapping(value = "/world_boardDelete.do")	 
	 @ResponseBody public int boardDeletelist(@RequestParam(value = "dlist", required = false) List<String> list) { 
	
		if(list != null) { 
			for(String str : list) { 
				str = str.split("\"")[1]; 
				int res = worldMapper.deleteBoardList(str);
				
				break; 
			} 
		} 
					 	
		return 1; 
	}
	
	 @RequestMapping(value = "/world_contentBoard.do", method = RequestMethod.GET)
		public String contentBoard(HttpServletRequest req,@ModelAttribute WorldBoardDTO dto) throws ServletRequestBindingException {
						 
		 	int board_num = ServletRequestUtils.getIntParameter(req, "board_num");
		 
			int plus_board_count = worldMapper.plusBoardCount(board_num);	
			
		 	WorldMemberAllDTO getBoard = worldMapper.getBoard(board_num);	
			List<WorldMemberAllDTO> list = worldMapper.listReply(board_num);
	
			req.setAttribute("plus_board_count", plus_board_count);
			req.setAttribute("listReply", list);
			req.setAttribute("getBoard", getBoard);		
			
			
			return "world/world_contentBoard";
		}
	 
	 @RequestMapping(value = "/world_replyBoard.do", method = RequestMethod.POST)
	 	public String replyBoard(HttpServletRequest req, @ModelAttribute WorldReplyDTO dto,@ModelAttribute WorldBoardDTO bdto) throws ServletRequestBindingException {
		 
		 String id = req.getParameter("id");		 
		 WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
//		 int member_num = 41;
		 int member_num = memberMapper.getMemberNum(memDTO);
		 int board_num = worldMapper.getBoardNum(bdto);	
		 dto.setMember_num(member_num);
		 dto.setBoard_num(board_num);
		 int res = worldMapper.insertReply(dto);
		 
		 if(res>0) {
	
			 req.setAttribute("msg", "답글이 등록되었습니다");
			 req.setAttribute("url", "world_contentBoard.do?board_num="+dto.getBoard_num());
			 
			 
		 }else {
			 req.setAttribute("msg", "답글 등록 실패");
			 req.setAttribute("url", "world_contentBoard.do");
					 
		 }	 
		 return "message";
		 
	 }
	 	
	 	@RequestMapping(value = "/world_editReply.do",method = RequestMethod.GET)
	 	public String editReply(HttpServletRequest req) throws ServletRequestBindingException {
	 		
	 	 	int reply_num = ServletRequestUtils.getIntParameter(req, "reply_num");
	 	 	int board_num = ServletRequestUtils.getIntParameter(req, "board_num");
	 		WorldMemberAllDTO getReply = worldMapper.getReply(reply_num);
	 		WorldMemberAllDTO getBoard = worldMapper.getBoard(board_num);
	 		
	 		req.setAttribute("getReply", getReply);
	 		req.setAttribute("getBoard", getBoard);
	 		
	 		return "world/world_editReply";
	 	}
	 
	 	@RequestMapping(value = "/world_editReply.do",method = RequestMethod.POST)
	 	public String editReplyOk(HttpServletRequest req,@ModelAttribute WorldReplyDTO dto,@ModelAttribute WorldBoardDTO bdto) throws ServletRequestBindingException {
	 		
	 	 int board_num = worldMapper.getBoardNum(bdto);
	 	 dto.setBoard_num(board_num);
	 	int res = worldMapper.updateReply(dto);
	 		
	 		if(res>0) { 			
	 			req.setAttribute("msg", "답글이 수정되었습니다");
	 			req.setAttribute("url", "world_contentBoard.do?board_num="+dto.getBoard_num());
	 		}else {
	 			req.setAttribute("msg", "답글수정실패");
	 			req.setAttribute("url", "world_editReply.do");			
	 		}
	 		
	 		return "message";
	 	}
	 
	 	@RequestMapping("/world_deleteReply.do")
	 	public String deleteReply(HttpServletRequest req,@ModelAttribute WorldReplyDTO dto,@ModelAttribute WorldBoardDTO bdto) throws ServletRequestBindingException {
	 		
		
//	 		int board_num = worldMapper.getBoardNum(bdto);
//	 		dto.setBoard_num(board_num);
	 		
	 		int reply_num = ServletRequestUtils.getIntParameter(req, "reply_num");	
	 		int res = worldMapper.deleteReply(reply_num);	 		
	 		if(res>0) {
	 			req.setAttribute("msg", "답글이 삭제되었습니다");
	 			req.setAttribute("url", "board_main.do");
	 		}else {
	 			req.setAttribute("msg", "답글 삭제실패");
	 			req.setAttribute("url","world_contentBoard.do"); 			
	 		}
	 		return "message";
	 	}	 
		@RequestMapping(value="/world_boardSearch.do", method = RequestMethod.POST)
		public String boardSearch(String search, String searchString, HttpServletRequest req,
												@RequestParam(required = false) Map<String, String> map) {
			System.out.println("search: " + search);
			
			if(searchString == null || searchString.trim().equals("")) {
							
			
				return "redirect:board_main.do";		
			}
				List<WorldMemberAllDTO> list = null;
				if(search.trim().equals("board_title")) {
					System.out.println(searchString);
					list = worldMapper.searchBoardTitle(searchString);
					System.out.println(" 제목 사이즈: " + list.size());
				}else if(search.trim().equals("board_content")) {
					list = worldMapper.searchBoardContent(searchString);
					System.out.println("내용 사이즈: " + list.size());
				}
				req.setAttribute("listBoard", list);
		
			return "world/world_board";
		}
	 
		@RequestMapping(value = "world_editBoard.do", method = RequestMethod.GET)
			public String edit_board(HttpServletRequest req) throws ServletRequestBindingException {
				
				int board_num = ServletRequestUtils.getIntParameter(req, "board_num");
				WorldMemberAllDTO getBoard = worldMapper.getBoard(board_num);
				
				req.setAttribute("getBoard", getBoard);
				
				return "world/world_editBoard";
				
				
			}
			
		@RequestMapping(value = "world_editBoard.do", method = RequestMethod.POST)
			public String edit_boardOK(HttpServletRequest req,@ModelAttribute WorldBoardDTO dto) {
			
			int res = worldMapper.updateBoard(dto);
			
			if(res>0){
				req.setAttribute("msg", "수정이 완료되었습니다");
				req.setAttribute("url", "world_contentBoard.do?board_num=" + dto.getBoard_num());
				
			}else {				
				req.setAttribute("msg", "수정 실패");
				req.setAttribute("url", "world_contentBoard.do");
			}
			return "message";
			
			
		}
		
	 @RequestMapping(value = "world_insertVisit.do", method = RequestMethod.POST)
	 	public String insertVisit(HttpServletRequest req,@ModelAttribute WorldVisitDTO vdto,@RequestParam(required=false) Map<String, String> map) {
		 
		 String id = req.getParameter("id");
		 WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
		 int member_num = memberMapper.getMemberNum(memDTO);	
		 int main_num = worldMapper.getMainNum(memDTO);
		
		 vdto.setMember_num(member_num);
		 vdto.setMain_num(main_num);
		 
		 int res = worldMapper.insertVisit(vdto);
		 
		 if(res>0) {
			 req.setAttribute("msg", "방명록을 등록하였습니다.");
			 req.setAttribute("url", "visit_main.do?member_num="+vdto.getMember_num()+"&id="+memDTO.getId()+"&main_num="+vdto.getMain_num());
		 }else {
			 req.setAttribute("msg", "등록 실패");
			 req.setAttribute("url", "visit_main.do");			 
		 }
		 
		 return "message";
	 	}
	 
	 @RequestMapping("world_deleteVisit.do")
	 public String deleteVisit(HttpServletRequest req,@ModelAttribute WorldVisitDTO dto) throws ServletRequestBindingException {
	
		 int visit_num = ServletRequestUtils.getIntParameter(req, "visit_num");
		 int res = worldMapper.deleteVisit(visit_num);
		 
		 if(res>0) {
			 req.setAttribute("msg", "게시글이 삭제되었습니다.");
			 req.setAttribute("url", "world_main.do");
		 }else {
			 req.setAttribute("msg", "삭제 실패");
			 req.setAttribute("url", "visit_main.do");
		 }
		 
		 return "message";
	 }
	 
	 @RequestMapping(value = "world_insertFamilyReply.do", method = RequestMethod.POST)
	 public String insertFamilyReply(HttpServletRequest req,@ModelAttribute WorldFamilyDTO dto) {
		
		 String id = req.getParameter("id");
		 WorldMemberDTO memDTO = memberMapper.getWorldMemberById(id);
		 int member_num = memberMapper.getMemberNum(memDTO);
		 dto.setMember_num(member_num);
		 
		 int res = worldMapper.insertFamilyReply(dto);
		 if(res>0) {
			 
			 req.setAttribute("msg", "일촌평을 등록하였습니다.");
			 req.setAttribute("url", "world_main.do?member_num="+dto.getMember_num()+"&id="+memDTO.getId());
		 }else {
			 req.setAttribute("msg", "삭제 실패");
			 req.setAttribute("url", "world_main.do");
		 }

	 	return "message";
	 	
	 }
	
	@RequestMapping(value = "world_editInfo.do", method = RequestMethod.GET)
		
		public String editInfo(HttpServletRequest req) throws ServletRequestBindingException {
			
			String id = ServletRequestUtils.getRequiredStringParameter(req, "id");			
			WorldMemberDTO memInfo = memberMapper.getWorldMemberById(id);
			req.setAttribute("memInfo", memInfo);
			
			return "world/world_editInfo";
		}
	
	@RequestMapping(value = "world_editInfo.do" , method = RequestMethod.POST)
	
		public String editInfoOk(HttpServletRequest req, @ModelAttribute WorldMemberDTO dto) {
			
			int res = worldMapper.updateInfo(dto);		
			if(res>0) {
				req.setAttribute("msg", "개인정보가 수정 되었습니다.");
				req.setAttribute("url", "world_main.do");
			}else {
				req.setAttribute("msg", "수정 실패");	
				req.setAttribute("url", "world_main.do");
			}
			return "message";
		}
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
