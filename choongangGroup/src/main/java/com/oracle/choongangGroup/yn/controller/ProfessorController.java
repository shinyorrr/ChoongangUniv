package com.oracle.choongangGroup.yn.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;
import com.oracle.choongangGroup.changhun.address.AddressRepository;
import com.oracle.choongangGroup.changhun.address.AddressService;
import com.oracle.choongangGroup.changhun.address.MemberRepository;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.hs.managerPage.ManagerPageRepository;
import com.oracle.choongangGroup.hs.managerPage.ManagerPageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProfessorController {
	
	public final MemberRepository mrr;
	private final ManagerPageRepository mr;
	private final AddressService addressService;
	private final ManagerPageService ms;
	
	private final GetMember gm;
	public final AddressRepository ar;
	
// ------------------ 마이페이지 --------------------------
		@RequestMapping("professor/mypage")
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
			
			model.addAttribute("mypage", member);
			model.addAttribute("mem", gm.getMember());
			return "professor/professorMypage";
		}
		
		@RequestMapping("professor/mypageSave")
		public String save(@ModelAttribute("member") Member member, MultipartFile file1, HttpServletRequest request) throws IOException, Exception {
			log.info("mypage save...");
			String userid = gm.getMember().getUserid();
			Member findMember = mr.findByUserid(userid);
			if(!file1.isEmpty()) {
				// 파일 저장
				String filePath = request.getSession().getServletContext().getRealPath("/fileUpload/hs/image/");
				String serverFileName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), filePath);
				
				findMember.setImage(serverFileName);
			}
			findMember.setAddress(member.getAddress());
			findMember.setEmail(member.getEmail());
			findMember.setPhone(member.getPhone());
			findMember.setSubphone(member.getSubphone());
			mr.save(findMember);
			return "redirect:/professor/mypage";
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
		
		/***********************
		***  주소록페이지 ***/
		/***********************/
		@RequestMapping(value = "professor/addressForm")
		public String addressForm(Model model,
				 				  @RequestParam(required = false, defaultValue = "0", value="page") int page) {
			
			Page<Member> addressList = mr.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.ASC,"name")));
			
			int totalPage = addressList.getTotalPages();
			
			model.addAttribute("member", gm.getMember());
			model.addAttribute("page", page);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("addressList",addressList.getContent());
			
			return "professor/professorAddressForm";
		}
		
		@RequestMapping(value = "professor/myLikeAddress")
		public String likeAddress(HttpServletRequest request, Model model,
								  @RequestParam(required = false, defaultValue = "0", value="page") int page) {
		
			String userid = gm.getMember().getUserid();
			
			Page<PhoneLike> like = ar.findByMyUserid(userid, PageRequest.of(page, 2, Sort.by(Sort.Direction.ASC,"member.name")));
			
			int totalPage = like.getTotalPages();
			
			System.out.println("totalpage -> " + totalPage);
			
			model.addAttribute("member", gm.getMember());
			model.addAttribute("page", page);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("likeList",like.getContent());
			
			return "professor/professorAddressLike";
		}
		
		@RequestMapping(value = "professor/searchAddress")
		public String searchAddress(Model model,HttpServletRequest request,
									@RequestParam(value = "search") String name,
						  			@RequestParam(required = false, defaultValue = "0", value="page") int page) {
			
		Page<Member> addressList = null;
		
		Member member = gm.getMember();
		
		if(name == null || name.equals("")) {
			addressList = mr.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.ASC,"name")));
		} else {
			addressList = mrr.findByNameContaining(name, PageRequest.of(page, 10, Sort.by(Sort.Direction.ASC,"name")));
		}
		
		int totalPage = addressList.getTotalPages();
		
		model.addAttribute("member", member);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("addressList",addressList.getContent());
		
		return "professor/professorAddressForm";
		}
		
		@RequestMapping("professor/phoneLikeSave")
		public String phoneLikeSave(@RequestParam(value = "userid") String userid) {
			String msg = null;
			
			log.info("userid 값은? -> {}",userid);
			Member member = gm.getMember();
			
			
			String Myuserid = member.getUserid(); 
			
			try {
				addressService.phoneLikeSave(userid,Myuserid);			
			} catch (Exception e) {
				msg = "이미 등록된 주소록입니다!";
			}
			return msg;
		}
		
		@RequestMapping("professor/phoneLikeDelete")
		public String phoneLikeDelete(@RequestParam(value = "myUserid") String myuserid,
									  @RequestParam(value = "userid") String userid) {
			addressService.phoneLikeDelete(myuserid,userid);
		return null;
		}
	// 캘린더이동 ---> 작업중 : 일단 연결만
//	@GetMapping(value = "professor/calenderForm") public String lecList(Model model) { //
//	String name = gm.getMember().getName();
//	String userid = gm.getMember().getUserid();
//	System.out.println(name);
//	return "/professor/calenderForm"; }

	

}
