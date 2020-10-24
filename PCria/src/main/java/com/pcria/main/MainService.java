package com.pcria.main;

import java.io.File;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		//업로드한 이미지 저장 공간 에러  
		String savePath = mreq.getServletContext().getRealPath("img") + "/u_profile/user/" + loginUser.getU_no(); //저장경로
		System.out.println("savePath : "+savePath);
		//저장 경로를 매개변수로 받는 File 타입의 변수 하나를 만든다.
		File directory = new File(savePath);
		//만약 디렉토리가 존재하지 않는다면, 디렉토리를 만든다.
		if(!directory.exists()) {directory.mkdirs();}
		
		//1024 * 1024 * 10(10mb) 매번 곱하는 것보다 곱한 값이 빠르다.
		int maxFileSize = 10_485_760;
		
		String fileNm = "";
		String originFileNm = "";
		String saveFileNm = null;
		
		try {
			//이름 중복되면 자동으로 이름 바꿔서 저장해줌. 저장 후 파일이름 변경해야됨
			MultipartRequest mr = new MultipartRequest(mreq, savePath, 
					maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = mr.getFileNames();
			//type : file이 이외의 form 태그 값들 받아오기
			//파일의 다음 엘리멘트가 더 있냐
			while(files.hasMoreElements()) {
				String key = (String)files.nextElement();
				fileNm = mr.getFilesystemName(key);
				originFileNm = mr.getOriginalFileName(key);
				if(originFileNm != null) {
					//확장자 추출
					int pos = fileNm.lastIndexOf( "." );
					String ext = fileNm.substring(pos);
					
					//예전 파일
					File oldFile = new File(savePath+"/"+fileNm);
					//공파일 만들기
					saveFileNm = UUID.randomUUID()+ext;
					System.out.println("saveFileNm : "+saveFileNm);
					File newFile = new File(savePath+"/"+saveFileNm);
					System.out.println("newFile : "+newFile);
					oldFile.renameTo(newFile);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
//		mapper.updUser(param);
//		//수정된 정보 다시 가져오기  
//		mapper.selUpdAfterUser(param);
		
		if(saveFileNm != null) {
			loginUser.setU_profile(saveFileNm);
		}
		loginUser.setU_name(param.getU_name());
		loginUser.setU_birth(param.getU_birth());
		loginUser.setM_dt(param.getM_dt());
		return 1;
	}
}
