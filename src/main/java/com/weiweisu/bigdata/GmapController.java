package com.weiweisu.bigdata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GmapController {
	
	@RequestMapping(value="/gmap2", method=RequestMethod.GET)
	public String showGmap() {
		return "gmap2";
	}
	
	@RequestMapping(value="/gmap2_usa", method=RequestMethod.GET)
	public String showGmap2USA() {
		return "gmap2_usa";
	}
}
