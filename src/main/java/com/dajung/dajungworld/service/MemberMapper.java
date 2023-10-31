package com.dajung.dajungworld.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dajung.dajungworld.dto.WorldMemberAllDTO;
import com.dajung.dajungworld.dto.WorldMemberDTO;



@Service
public class MemberMapper {
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
@Autowired
private SqlSession sqlSession;

	public int joinMember(WorldMemberDTO dto) {

	return 	sqlSession.insert("joinMember",dto);
	}

	public int idUseCheck(String id) {

	int res = sqlSession.selectOne("idUseCheck", id);
	
	return res;
	}
	
	public int checkLogin(String id, String password) {
		WorldMemberDTO dto = sqlSession.selectOne("checkLogin", id);
		
		if (dto != null) {
			if (dto.getPassword().equals(password)) {
							
				return OK;
				
			}else {
				return NOT_PW;
			}
		} else {
			return NOT_ID;
		}
	}
	
	public int checkJoin(HashMap<String, Object> userInfo) {
		
		return sqlSession.selectOne("checkJoin",userInfo);
	}

	
	public WorldMemberDTO getWorldMemberById(String id) {
		WorldMemberDTO dto = sqlSession.selectOne("getWorldMemberById", id);
		
		return dto;
	}

	public List<WorldMemberAllDTO> listUpdateNews(int member_num) {
		
		return sqlSession.selectList("listUpdateNews", member_num);
		
	}

	public String getMemberId(WorldMemberDTO memDTO) {
		
		return sqlSession.selectOne("getMemberId", memDTO);
	}

	public int getMemberNum(WorldMemberDTO dto) {
		
		return sqlSession.selectOne("getMemberNum", dto);
	}

	public WorldMemberAllDTO getBoardNews(int board_num) {
		
		return sqlSession.selectOne("getBoardNews", board_num);
	}

	public String findIdHp(WorldMemberDTO dto) {
		
		return sqlSession.selectOne("findIdHp",dto);
	}

	public String findIdEmail(WorldMemberDTO dto) {

		return sqlSession.selectOne("findIdEmail", dto	);
	}

	public int findPw(Map<String, String> map) {
	
		return sqlSession.selectOne("findPw" , map);
	}

	public int resetPw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("resetPw", map);
	}

	public List<WorldMemberDTO> listMember() {
	
		return sqlSession.selectList("listMember");
	}
	

}
