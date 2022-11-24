package com.oracle.choongangGroup.changhun.address;


import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AddressController {
	
	public final MemberRepository memberRepository;
	public final AddressRepository addressRepository;
	public final AddressService addressService;
	
//	@RequestMapping(value = "/addressForm")
//	public String addressForm(Model model) {
//		
//		List<Member> addressList = addressService.findByAddress();
//		
//		
//		log.info("addressForm addressList.size() -> {}" , addressList.size());
//		
//		model.addAttribute("addressList",addressList);
//		
//		return "manager/addressForm";
//	}
	
	@RequestMapping(value = "/addressForm")
	public String addressForm(Model model,
			 				  @RequestParam(required = false, defaultValue = "0", value="page") int page) {
		
		Page<Member> addressList = memberRepository.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.ASC,"name")));
		
		int totalPage = addressList.getTotalPages();
		
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("addressList",addressList.getContent());
		
		return "manager/addressForm";
	}
	
//	@RequestMapping(value = "/myLikeAddress")
//	public String likeAddress(HttpSession session,Model model) {
//		
//		String userid = "18301001";
//		
//		List<PhoneLike> likeList = addressService.likeAddress(userid);
//		
//		model.addAttribute("likeList",likeList);
//		
//		return "manager/addressLike";
//	}
	@RequestMapping(value = "/myLikeAddress")
	public String likeAddress(HttpSession session,Model model,
							  @RequestParam(required = false, defaultValue = "0", value="page") int page) {
		
		String userid = "18301001";
		
		Page<PhoneLike> like = addressRepository.findByMyUserid(userid, PageRequest.of(page, 2, Sort.by(Sort.Direction.ASC,"member.name")));
		
		int totalPage = like.getTotalPages();
		
		System.out.println("totalpage -> " + totalPage);
		
		
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("likeList",like.getContent());
		
		return "manager/addressLike";
	}
	

}
