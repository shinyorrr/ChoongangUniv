package com.oracle.choongangGroup.hs.managerPage;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/manager")
public class ManagerPageController {
	
	private final ManagerPageService ms;
	private final ManagerPageRepository mr;
	private final GetMember gm;
	
	@RequestMapping("/mypage")
	public String form(Model model) {
		log.info("mypage Start...");
		String userid = gm.getMember().getUserid();
		Member member = ms.findByUserid(userid);
		
		try {
			String strDate = member.getBirth();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
			Date birth = dateFormat.parse(strDate);
			String birthDate = new SimpleDateFormat("yyyy-MM-dd").format(birth);
			member.setBirth(birthDate);
		} catch (Exception e) {
			log.info("mypage Exception->{}", e.getMessage());
		}
		
		model.addAttribute("member", member);
		return "/manager/mypage";
	}
	
	@RequestMapping("/mypageSave")
	public String save(@ModelAttribute("member") Member member, MultipartFile file1, HttpServletRequest request) throws IOException, Exception {
		log.info("mypage save...");
		String userid = gm.getMember().getUserid();
		Member findMember = mr.findByUserid(userid);
		if(!file1.isEmpty()) {
			// 파일 저장
			String filePath = request.getSession().getServletContext().getRealPath("/fileUpload/hs/image/");
			log.info("file POST Start...");
			log.info("originalName: {}", file1.getOriginalFilename());
			log.info("size: {}", file1.getSize());
			log.info("contentType: {}", file1.getContentType());
			log.info("filePath: {}", filePath);
			String serverFileName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), filePath);
			log.info("serverFileName: {}", serverFileName);
			
			findMember.setAddress(member.getAddress());
			findMember.setEmail(member.getEmail());
			findMember.setPhone(member.getPhone());
			findMember.setSubphone(member.getSubphone());
			findMember.setImage(filePath+serverFileName);
			log.info(findMember.getImage());
			mr.save(findMember);
		} else {
			findMember.setAddress(member.getAddress());
			findMember.setEmail(member.getEmail());
			findMember.setPhone(member.getPhone());
			findMember.setSubphone(member.getSubphone());
			mr.save(findMember);
		}
		return "redirect:/manager/mypage";
	}
	
	// 이미지 업로드 메서드
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		// universally unique identifier (UUID).
		UUID uid = UUID.randomUUID();
		// requestPath = requestPath + "/resources/image";
		log.info("uploadPath->{}",uploadPath);
		// Directory 생성
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdir(); // mkdir 신규 폴더 생성
			log.info("업로드용 폴더 생성 : {}", uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName;
		log.info("savedName: {}", savedName);
		File target = new File(uploadPath, savedName);
		// File target = new File(requestPath, savedName);
		// File Upload -> uplaodPath / UUID+_+originalName
		FileCopyUtils.copy(fileData, target); // org.springframework.util.FileCopyUtils
		
		return savedName;
	}
	
}
