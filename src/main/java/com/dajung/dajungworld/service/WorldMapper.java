package com.dajung.dajungworld.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dajung.dajungworld.dto.WorldBoardDTO;
import com.dajung.dajungworld.dto.WorldFamilyDTO;
import com.dajung.dajungworld.dto.WorldMemberAllDTO;
import com.dajung.dajungworld.dto.WorldMemberDTO;
import com.dajung.dajungworld.dto.WorldPhotoDTO;
import com.dajung.dajungworld.dto.WorldPhotoImgDTO;
import com.dajung.dajungworld.dto.WorldReplyDTO;
import com.dajung.dajungworld.dto.WorldTodayDTO;
import com.dajung.dajungworld.dto.WorldVisitDTO;

@Service
public class WorldMapper {

	@Autowired
	private SqlSession sqlSession;


	public WorldMemberDTO getMain(int member_num) {
		WorldMemberDTO gdto = sqlSession.selectOne("getMain", member_num);

		return gdto;
	}

	public int insertPhoto(WorldPhotoDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertPhoto", dto);
	}

	public List<WorldMemberAllDTO> listPhoto(int member_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("listPhoto", member_num);
	}

	public int getPhotoNum(WorldPhotoDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getPhotoNum", dto);
	}

	public int insertPhotoImg(WorldPhotoImgDTO imgDTO) {

		return sqlSession.insert("insertPhotoImg", imgDTO);
	}

	public WorldMemberAllDTO getPhoto(int photo_num) {

		return sqlSession.selectOne("getPhoto", photo_num);

	}

	public WorldPhotoImgDTO imageList(int photo_num) {
		return sqlSession.selectOne("imageList", photo_num);
	}

	public int updatePhotoImage(WorldPhotoImgDTO imgDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("updatePhotoImage", imgDTO);
	}

	public int updatePhoto(WorldPhotoDTO dto) {

		return sqlSession.update("updatePhoto", dto);
	}

	public int deletePhoto(int photo_num) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deletePhoto", photo_num);
	}

	public int deletePhotoImg(int photo_num) {

		return sqlSession.delete("deletePhotoImg", photo_num);

	}

	public int updateMain(WorldMemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateMain", dto);
	}

	public List<WorldMemberAllDTO> listBoard(int member_num) {
		return sqlSession.selectList("listBoard", member_num);
	}

	public int insertBoard(WorldBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertBoard", dto);
	}

	public int getListBoardCount(int member_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getListBoardCount",member_num);
	}

	public int deleteBoardList(String num) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deleteBoardList", num);
	}

	public WorldMemberAllDTO getBoard(int board_num) {

		return sqlSession.selectOne("getBoard", board_num);

	}

	public List<WorldMemberAllDTO> listReply(int board_num) {

		return sqlSession.selectList("listReply", board_num);
	}

	public int insertReply(WorldReplyDTO dto) {

		return sqlSession.insert("insertReply", dto);
	}

	public WorldMemberAllDTO getReply(int reply_num) {

		return sqlSession.selectOne("getReply", reply_num);

	}

	public int getBoardNum(WorldBoardDTO bdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBoardNum", bdto);
	}

	public List<WorldMemberAllDTO> searchBoardTitle(String searchString) {

		return sqlSession.selectList("searchBoardTitle", "%" + searchString + "%");
	}

	public List<WorldMemberAllDTO> searchBoardContent(String searchString) {

		return sqlSession.selectList("searchBoardContent", "%" + searchString + "%");

	}

	public int plusBoardCount(int board_num) {

		return sqlSession.update("plusBoardCount", board_num);
	}

	public int updateBoard(WorldBoardDTO dto) {

		return sqlSession.update("updateBoard", dto);
	}

	public int deleteReply(int reply_num) {

		return sqlSession.delete("deleteReply", reply_num);
	}

	public int updateReply(WorldReplyDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateReply", dto);
	}

	public int insertVisit(WorldVisitDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertVisit", dto);
	}

	public List<WorldMemberAllDTO> listVisit(int member_num) {

		return sqlSession.selectList("listVisit",	member_num);
	}
	public int getListVisitCount(int member_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getListVisitCount",member_num);
	}

	public int getMainNum(WorldMemberDTO memDTO) {

		return sqlSession.selectOne("getMainNum", memDTO);
	}

	public int deleteVisit(int visit_num) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deleteVisit", visit_num);
	}

	public List<WorldMemberAllDTO> listFamilyReply(int member_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("listFamilyReply",member_num);
	}

	public int insertFamilyReply(WorldFamilyDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertFamilyReply", dto);
	}

//today
	public int setTotalCount(WorldTodayDTO tdto) {

		return sqlSession.insert("setTotalCount", tdto);
	}

	public int getTotalCount(int member_num) {

		return sqlSession.selectOne("getTotalCount",member_num);
	}

	

	public int getListPhotoCount(int member_num) {
		
		return sqlSession.selectOne("getListPhotoCount",member_num);
	}
	/*
	 * public int getListReadBoardCount() { // TODO Auto-generated method stub
	 * return sqlSession.selectOne("getListReadBoardCount"); }
	 */

	public int updateInfo(WorldMemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateInfo", dto);
	}

	public int getBoardReplyCount(int board_num) {

		return sqlSession.selectOne("getBoardReplyCount", board_num);
	}

	public WorldTodayDTO getToday(int member_num) {
		WorldTodayDTO tdto = sqlSession.selectOne("getToday", member_num);

		return tdto;
	}

	public int getTodayCount(int member_num) {
		
		return sqlSession.selectOne("getTodayCount", member_num);
	}

//	public WorldMainDTO getMainCheck(int member_num) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("getMainCheck", member_num);
//	}

}
