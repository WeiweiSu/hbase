package com.weiweisu.bigdata;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweisu.bigdata.dao.PhysicianInfoDAO;
import com.weiweisu.bigdata.model.PhysicianInfo;

@Controller
public class HBaseSearchController {
	
	@Autowired
	private PhysicianInfoDAO physicianInfoDAO;
	
	@RequestMapping(value="/search1/{ps}+{state}", method=RequestMethod.GET)
	public @ResponseBody List<PhysicianInfo> getResultByPSandState(@PathVariable String ps, @PathVariable String state) throws IOException {
		if((ps == null || ps.equals("")) && (state == null || state.equals(""))) {
			return null;
		}
		
		if(ps == null || ps.equals("")) {
			return physicianInfoDAO.getResultByState(state);
		}
		
		if(state == null || state.equals("")) {
			return physicianInfoDAO.getResultByPS(ps);
		}
		
		return physicianInfoDAO.getResultByPSandState(ps, state);
	}
	
}
