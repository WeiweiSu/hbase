package com.weiweisu.bigdata;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweisu.bigdata.dao.PhysicianInfoDAO;
import com.weiweisu.bigdata.model.PhysicianInfo;

@Controller
public class HBaseController {

	@Autowired
	private PhysicianInfoDAO physicianInfoDAO;
	
	@RequestMapping(value="/searchfirstname/{fname}", method=RequestMethod.GET)
	public @ResponseBody List<PhysicianInfo> getResultByFirstName(@PathVariable String fname) throws IOException {
		if(fname == null || fname.equals("")) {
			return null;
		}
		
		List<PhysicianInfo> lists = physicianInfoDAO.getResultByFirstName1(fname);
		lists.size();
		return lists;
	}

	
	
	@RequestMapping(value="/search/{fname}+{lname}", method=RequestMethod.GET)
	public @ResponseBody List<PhysicianInfo> getResultByFirstName(@PathVariable String fname, @PathVariable String lname) throws IOException {
		if((fname == null || fname.equals("")) && (lname == null || lname.equals(""))) {
			return null;
		}
		
		if(fname == null || fname.equals("")) {
			return physicianInfoDAO.getResultByLastName(lname);
		}
		
		if(lname == null || lname.equals("")) {
			return physicianInfoDAO.getResultByFirstName1(fname);
		}
		
		return physicianInfoDAO.getResultByFirstAndLastName(fname, lname);
	}
	
}
