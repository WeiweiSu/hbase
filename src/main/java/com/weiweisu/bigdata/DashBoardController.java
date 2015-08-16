package com.weiweisu.bigdata;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashBoardController {

	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String page2(Locale locale, Model model) {
		
		return "dashboard";
	}
}
