package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.changhun.JPA.Member;

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

}
