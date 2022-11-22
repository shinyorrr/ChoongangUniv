package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AddressController {
	
	public final AddressService addressService;
	
	@RequestMapping(value = "/addressForm")
	public String addressForm(Model model) {
		
		List<Member> addressList = addressService.findByAddress();
		
		
		log.info("addressForm addressList.size() -> {}" , addressList.size());
		
		model.addAttribute("addressList",addressList);
		
		return "manager/addressForm";
	}
	
	@RequestMapping(value = "/myLikeAddress")
	public String likeAddress(HttpSession session,Model model) {
		
		String userid = "18301001";
		
		List<PhoneLike> likeList = addressService.likeAddress(userid);
		
		model.addAttribute("likeList",likeList);
		
		return "manager/addressLike";
	}

}
