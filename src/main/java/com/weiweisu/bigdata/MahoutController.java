package com.weiweisu.bigdata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MahoutController {

	@RequestMapping(value="/mahout", method=RequestMethod.GET)
	public String showPage() {
		return "mahout";
	}
	
}
