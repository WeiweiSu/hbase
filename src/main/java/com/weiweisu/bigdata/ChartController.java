package com.weiweisu.bigdata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChartController {

	@RequestMapping(value="/gmap2_chart", method=RequestMethod.GET)
	public String showPage() {
		return "gmap2_chart";
	}
}
