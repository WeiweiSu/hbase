package com.weiweisu.bigdata.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.stereotype.Repository;

import com.weiweisu.bigdata.model.PhysicianInfo;

@Repository
public class PhysicianInfoDAO {

	public List<PhysicianInfo> getResultByFirstName(String fname) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(fname);
	      Scan scan = new Scan(prefix);
	      Filter prefixFilter = new PrefixFilter(prefix);
	      scan.setFilter(prefixFilter);
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      return results;
	}
	
	public List<PhysicianInfo> getResultByFirstName1(String fname) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(fname);
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("provider_identification"), Bytes.toBytes("First_Name")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(fname));
	      scan.setFilter(colValFilter);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      return results;
	}
	
	public List<PhysicianInfo> getResultByLastName(String lname) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(lname);
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("provider_identification"), Bytes.toBytes("Last_Name")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(lname));
	      scan.setFilter(colValFilter);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      return results;
	}
	
	public List<PhysicianInfo> getResultByFirstAndLastName(String fname, String lname) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(fname);
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("provider_identification"), Bytes.toBytes("First_Name")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(fname));
	      Filter colValFilter1 = new SingleColumnValueFilter(Bytes.toBytes("provider_identification"), Bytes.toBytes("Last_Name")
		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(lname));
	      
	      FilterList filterList = new FilterList(FilterList.Operator.MUST_PASS_ALL);
	      filterList.addFilter(colValFilter);
	      filterList.addFilter(colValFilter1);
	      
	      scan.setFilter(filterList);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      return results;
	}
	
	private List<PhysicianInfo> createPhysicianInfoObject(ResultScanner resultScanner) {
		List<PhysicianInfo> physicianInfoList = new ArrayList<PhysicianInfo>();
		for(Iterator<Result> iterator = resultScanner.iterator(); iterator.hasNext();) {
			Result result = iterator.next();
			PhysicianInfo physicianInfo = new PhysicianInfo();
			
			physicianInfo.setNpi(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("NPI"))));
			physicianInfo.setPac_ID(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("PAC_ID"))));
			physicianInfo.setProfessional_Enrollment_ID(Bytes.toString(result.getRow()));
			physicianInfo.setLast_Name(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("Last_Name"))));
			physicianInfo.setFirst_Name(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("First_Name"))));
			physicianInfo.setMiddle_Name(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("Middle_Name"))));
			physicianInfo.setSuffix(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("Suffix"))));
			physicianInfo.setGender(Bytes.toString(result.getValue(Bytes.toBytes("provider_identification"), Bytes.toBytes("Gender"))));
			
			physicianInfo.setCredential(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Credential"))));
			physicianInfo.setMedical_school_name(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Medical_school_name"))));
			physicianInfo.setGraduation_year(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Graduation_year"))));
			physicianInfo.setPrimary_specialty(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Primary_specialty"))));
			physicianInfo.setSecondary_specialty_1(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Secondary_specialty_1"))));
			physicianInfo.setSecondary_specialty_2(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Secondary_specialty_2"))));
			physicianInfo.setSecondary_specialty_3(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Secondary_specialty_3"))));
			physicianInfo.setSecondary_specialty_4(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Secondary_specialty_4"))));
			physicianInfo.setAll_secondary_specialties(Bytes.toString(result.getValue(Bytes.toBytes("medical_credentials"), Bytes.toBytes("All_secondary_specialties"))));
			
			
			physicianInfo.setOrganization_legal_name(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Organization_legal_name"))));
			physicianInfo.setOrganization_DBA_name(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Organization_DBA_name"))));
			physicianInfo.setGroup_Practice_PAC_ID(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Group_Practice_PAC_ID"))));
			physicianInfo.setNumber_of_Group_Practice_members(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Number_of_Group_Practice_members"))));
			physicianInfo.setLine_1_Street_Address(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Line_1_Street_Address"))));
			physicianInfo.setLine_2_Street_Address(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Line_2_Street_Address"))));
			physicianInfo.setMarker_of_address_line_2_suppression(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Marker_of_address_line_2_suppression"))));
			physicianInfo.setCity(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("City"))));
			physicianInfo.setState(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("State"))));
			physicianInfo.setZip_Code(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Zip_Code"))));
			physicianInfo.setClaims_based_hospital_affiliation_CCN_1(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_CCN_1"))));
			physicianInfo.setClaims_based_hospital_affiliation_LBN_1(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_LBN_1"))));
			physicianInfo.setClaims_based_hospital_affiliation_CCN_2(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_CCN_2"))));
			physicianInfo.setClaims_based_hospital_affiliation_LBN_2(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_LBN_2"))));
			physicianInfo.setClaims_based_hospital_affiliation_CCN_3(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_CCN_3"))));
			physicianInfo.setClaims_based_hospital_affiliation_LBN_3(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_LBN_3"))));
			physicianInfo.setClaims_based_hospital_affiliation_CCN_4(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_CCN_4"))));
			physicianInfo.setClaims_based_hospital_affiliation_LBN_4(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_LBN_4"))));
			physicianInfo.setClaims_based_hospital_affiliation_CCN_5(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_CCN_5"))));
			physicianInfo.setClaims_based_hospital_affiliation_LBN_5(Bytes.toString(result.getValue(Bytes.toBytes("medical_practice"), Bytes.toBytes("Claims_based_hospital_affiliation_LBN_5"))));
			
			
			physicianInfo.setProfessional_accepts_Medicare_Assignment(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Professional_accepts_Medicare_Assignment"))));
			physicianInfo.setParticipating_in_eRx(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Participating_in_eRx"))));
			physicianInfo.setParticipating_in_PQRS(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Participating_in_PQRS"))));
			physicianInfo.setParticipating_in_EHR(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Participating_in_EHR"))));
			physicianInfo.setReceived_PQRS_Maintenance_of_Certification_Program_Incentive(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Received_PQRS_Maintenance_of_Certification_Program_Incentive"))));
			physicianInfo.setParticipated_in_Million_Hearts(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("Participated_in_Million_Hearts"))));
			physicianInfo.setRepeatednum(Bytes.toString(result.getValue(Bytes.toBytes("medical_assignment"), Bytes.toBytes("repeatednum"))));
			
			physicianInfoList.add(physicianInfo);
		}
		
		return physicianInfoList;
	}
	
	
	public List<PhysicianInfo> getResultByPS(String ps) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(ps);
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Primary_specialty")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(ps));
	      scan.setFilter(colValFilter);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      return results;
	}
	
	public List<PhysicianInfo> getResultByState(String state) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      byte[] prefix = Bytes.toBytes(state);
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("medical_practice"), Bytes.toBytes("State")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(state));
	      scan.setFilter(colValFilter);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      System.out.println( results.size());
	      return results;
	}
	
	
	public List<PhysicianInfo> getResultByPSandState(String ps, String state) throws IOException {
		// Instantiating Configuration class
	      Configuration config = HBaseConfiguration.create();

	      // Instantiating HTable class
	      HTable table = new HTable(config, "physicianTable");
	      
	      Scan scan = new Scan();
	      
	      Filter colValFilter = new SingleColumnValueFilter(Bytes.toBytes("medical_credentials"), Bytes.toBytes("Primary_specialty")
	    		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(ps));
	      Filter colValFilter1 = new SingleColumnValueFilter(Bytes.toBytes("medical_practice"), Bytes.toBytes("State")
		          , CompareFilter.CompareOp.EQUAL, new SubstringComparator(state));
	      
	      FilterList filterList = new FilterList(FilterList.Operator.MUST_PASS_ALL);
	      filterList.addFilter(colValFilter);
	      filterList.addFilter(colValFilter1);
	      
	      scan.setFilter(filterList);
	      
	      ResultScanner resultScanner = table.getScanner(scan);
	      
	      List<PhysicianInfo> results = createPhysicianInfoObject(resultScanner);
	      
	      return results;
	}
	
}
