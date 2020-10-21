package com.pcria.access;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcria.Const;
import com.pcria.SecurityUtils;
import com.pcria.access.model.AccessVO;

@Service
public class AccessService {

	@Autowired
	private AccessMapper mapper;
	
	public int login(AccessVO param) {
		if(param.getU_id().equals("")) {
			return Const.NO_ID;
		}
		AccessVO dbUser = mapper.selUser(param);
		
		if(dbUser == null) {
			return Const.NO_ID;
		}
		// 여기까지 왔다면 ID는 존재함!
		
		String cryptPw = SecurityUtils.getEncrypt(param.getU_password(), dbUser.getSalt());
		if(!cryptPw.equals(dbUser.getU_password())) {
			return Const.NO_PW;
		}
		param.setU_no(dbUser.getU_no());
		param.setU_password(null);
		param.setU_name(dbUser.getU_name());
		param.setU_wallet(dbUser.getU_wallet());
		param.setU_birth(dbUser.getU_birth());
		param.setU_time(dbUser.getU_time());
		return Const.SUCCESS;
	}
	
	public int join(AccessVO param) {
		String pw = param.getU_password();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setU_password(cryptPw);
		
		return mapper.insUser(param);
	}
	
	public AccessVO userInfo(AccessVO param, HttpServletRequest req) {
		int u_no = SecurityUtils.getLoginUserPk(req);
		param.setU_no(u_no);
		
		AccessVO data = mapper.selUser(param);
		
		return data;
	}
}
