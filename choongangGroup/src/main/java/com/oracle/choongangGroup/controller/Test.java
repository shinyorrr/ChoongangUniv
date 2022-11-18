package com.oracle.choongangGroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	@RequestMapping(value = "/")
	public String main() {
		System.out.println("test meth start");
		return "contentSample";
	}
}
