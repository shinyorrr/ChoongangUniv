package com.oracle.choongangGroup.ry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PaymentController {
//	//결제처리
//	@PostMapping("/payment")
//	public String payment(Model model, Payment payment, RedirectAttributes reAttr
//							,ChallengeGatherPlanDo challengeGatherPlanDo) {
//		
//		model.addAttribute("title", "결제");
//		String paymentGroupCode =payment.getPaymentGroupCode();
//		
//		int result = paymentService.addPayment(payment);
//		if(result == 1 && paymentGroupCode.startsWith("c") == true ) {
//	    	//결제 성공시 챌린지 플랜 insert 처리
//			challengeEnterService.challengeGatherPlanDoInsert(challengeGatherPlanDo);
//		}
//	    	//결제 실패시 챌린지 참여 테이블 delete 처리 필요
//		
//		reAttr.addAttribute("paymentCode", payment.getPaymentCode());
//		
//		return "redirect:/mypage/mypaymentList/paymentDetail";
//	}
}
