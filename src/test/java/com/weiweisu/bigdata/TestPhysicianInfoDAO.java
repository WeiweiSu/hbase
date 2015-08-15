package com.weiweisu.bigdata;

import java.io.IOException;
import java.util.List;

import org.junit.Test;

import com.weiweisu.bigdata.dao.PhysicianInfoDAO;
import com.weiweisu.bigdata.model.PhysicianInfo;

public class TestPhysicianInfoDAO {

	@Test
	public void test() throws IOException {
		PhysicianInfoDAO phyDAO = new PhysicianInfoDAO();
		List<PhysicianInfo> lists = phyDAO.getResultByFirstName1("ETHAN");
		
		int count = 0;
		for(PhysicianInfo phy : lists) {
			count++;
			System.out.print(phy.getProfessional_Enrollment_ID() + ", ");
			System.out.print(phy.getFirst_Name() + ", ");
			System.out.print(phy.getMedical_school_name());
			System.out.println();
		}
		
		System.out.println("Returned rows is :" + count);
		
	}
	
}
