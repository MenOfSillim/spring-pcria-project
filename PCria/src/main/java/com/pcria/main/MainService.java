package com.pcria.main;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pcria.FileUtils;
import com.pcria.SecurityUtils;
import com.pcria.access.model.AccessVO;
import com.pcria.main.model.FoodVO;
import com.pcria.main.model.SeatDMI;
import com.pcria.main.model.SeatVO;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;
	
	public List<FoodVO> selFoodList(FoodVO param){
		List<FoodVO> list = null;
		if(param.getChk() >= 1 && param.getChk() <= 6) {
			list = mapper.selFoodList(param);
		}else {
			list = mapper.selFoodList(param);
		}
		return list;
	}
	
	public List<SeatVO> selSeat(){
		return mapper.selSeat();
	}
	//seat 관련 service
	public int insSeat(SeatDMI param) {
		return mapper.insSeat(param);
	}
	public int updSeat(SeatDMI param) {
		return mapper.updSeat(param);
	}
	public int delSeat(AccessVO param) {
		return mapper.delSeat(param);
	}
	public AccessVO selLoginUserSeat(int u_no) {
		return mapper.selLoginUserSeat(u_no);
	}
	//profile 관련 service
	public int updProfile(MultipartHttpServletRequest mreq, AccessVO param, HttpSession hs) {
		AccessVO loginUser = SecurityUtils.getLoginUser(hs);
		param.setU_no(loginUser.getU_no());
		
		MultipartFile file = mreq.getFile("profile_img");
		String savePath = mreq.getServletContext().getRealPath("resources")
				+ "/img/u_profile/user/" + loginUser.getU_no()+"/";
		String originFileNm = file.getOriginalFilename();
		
		if(!param.getU_password().equals("")) {
			String salt = SecurityUtils.generateSalt();
			String cryptPw = SecurityUtils.getEncrypt(param.getU_password(), salt);
	        param.setU_password(cryptPw);
	        param.setSalt(salt);         
	    }
		if(originFileNm.trim() != null && originFileNm.trim() != "") {
			File prev_file = new File(savePath+loginUser.getU_profile());
			if(prev_file.exists()) prev_file.delete();
			String ext = FileUtils.getExt(originFileNm);
			String saveFileNm = UUID.randomUUID() + ext;
			try {
				file.transferTo(new File(savePath+saveFileNm));
				param.setU_profile(saveFileNm);
				loginUser.setU_profile(param.getU_profile());
			} catch (Exception e) {
				System.out.println("파일 등록 실패");
			}
		}
		int result = 0;
		result = mapper.updProfile(param);
		loginUser.setU_birth(param.getU_birth());
		loginUser.setU_name(param.getU_name());
		return result;
	}
}
