package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.type;
import com.springmvc.domain.ProductMember;

@Repository
public class ManagerRepositoryImpl implements ManagerRepository {

	
	 public ManagerRepositoryImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	private JdbcTemplate template;

	 @Autowired
	     public void setJdbctemplate(DataSource dataSource) 
	 	 {
	         this.template = new JdbcTemplate(dataSource);
	     }
	
	@Override
	public void getaddProductManager(ProductMember productMember) 
	{
		String SQL = "insert into ProductMember(PersonId, PersonPw, PersonEmail, PersonAddress, PersonName, PersonBirth, PersonSex  ,PersonPhone, CompanyName, CompanyAddress, CompanyPhone, s_image, Type)" + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL, new Object[] {productMember.getPersonId(), productMember.getPersonPw(), productMember.getPersonEmail(), productMember.getPersonAddress(),
						productMember.getPersonName(), productMember.getPersonBirth(), productMember.getPersonSex() ,productMember.getPersonPhone(), productMember.getCompanyName(), productMember.getCompanyAddress(),
						productMember.getCompanyPhone(), productMember.getS_image(), productMember.getType()});
	}
	
	// 전체 id db에 값을 넣어줌
	@Override
	public void setAllMember(ProductMember productMember) 
	{
		String SQL = "insert into Person values(?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL, productMember.getPersonId(), productMember.getPersonPw(), productMember.getPersonEmail(), productMember.getPersonAddress(),
				productMember.getPersonName(), productMember.getPersonBirth(), productMember.getPersonSex(), productMember.getPersonPhone(), productMember.getType(), productMember.getC_image());
	}

	@Override
	public type managerlogin(type manager) 
	{
	    String SQL = "select count(*) from Person where PersonId=?";
	    Integer intNum = template.queryForObject(SQL, Integer.class, manager.getPersonId());
	    System.out.println("intNum : " + intNum);
	    type managerId = null;
	    if(intNum != null && intNum != 0)
	    {
	        String ManagerSQL ="select * from Person where PersonId=?";
	        // RowMapper 객체를 정의해야 합니다. RowMapper는 인터페이스이므로 익명 클래스를 사용할 수 있습니다.
	        managerId = template.queryForObject(ManagerSQL, new Object[] {manager.getPersonId()}, new managerDBController());

	        System.out.println(managerId.getPersonId());
	        System.out.println(managerId.getType());
	    }
	    return managerId;
	}

	// 전체 id db 데이터를 삭제하는 함수
	@Override
	public void AllmanagerDelete(String managerId) {
		String SQL = "delete from ProductMember where PersonId = ?";
		template.update(SQL, managerId);
	}
	// Member 데이터를 삭제하는 함수
	@Override
	public void P_managerDelete(String managerId) {
		String SQL = "delete from Person where PersonId = ?";
		template.update(SQL, managerId);
	}
	// mypage로 이동하기 위한 값을 가져옴

/*	@Override
	public ProductMember managerPage(String personId) {
		String SQL = "select count(*) from ProductMember where PersonId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		System.out.println("intNum managerPage : " + intNum);
		ProductMember productMember = new ProductMember();
		if(intNum != null || intNum != 0) {
			String managerSQL = "select * from ProductMember where PersonId = ?";
			productMember = template.queryForObject(managerSQL, new Object[] {personId}, new ProductMemberDBConnector());
		}
		return productMember;
	}*/
	
	// prodcut 관리자 회원 정보를 수정하기 전 보여주는 함수
/*	@Override
	public ProductMember managerUpdate(String personId) {
		String SQL = "select count(*) from ProductMember where PersonId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		ProductMember productMember = new ProductMember();
		if(intNum != null || intNum != 0) {
			String managerSQL = "select * from ProductMember where PersonId = ?";
			productMember = template.queryForObject(managerSQL, new Object[] {personId}, new ProductMemberDBConnector());
		}
		return productMember;
	}
	

	// 수정 후 보여주기 위해 데이터를 가져옴
	@Override
	public ProductMember setmanagerUpdate(ProductMember productMemId) {
		String SQL = "select count(*) from ProductMember where PersonId=?";
		  Integer intNum = template.queryForObject(SQL, Integer.class, productMemId.getPersonId());
		  ProductMember ProductMemberId = null;
		  if(intNum != null && intNum != 0)
		    {
			  String ManagerSQL ="select * from ProductMember where PersonId=?";
			  ProductMemberId = template.queryForObject(ManagerSQL, new Object[] {productMemId.getPersonId()}, new ProductMemberDBConnector());
		    }
		return ProductMemberId;
	} */
	
	// 병원 manager 회원가입 하는 함수
	   @Override
	   public void addHospitalManager(HospitalMember hospitalMember) {
	      // 1
	      System.out.println(hospitalMember.getPersonId());
	      // 2
	      System.out.println(hospitalMember.getPersonPw());
	      // 3
	      System.out.println(hospitalMember.getPersonEmail());
	      // 4
	      System.out.println(hospitalMember.getPersonName());
	      // 5
	      System.out.println(hospitalMember.getPersonPhone());
	      // 6
	      System.out.println(hospitalMember.getHospitalName());
	      // 7
	      System.out.println(hospitalMember.getHospitalAddress());
	      // 8
	      System.out.println(hospitalMember.getHospitalPhone());
	      // 9
	      System.out.println(hospitalMember.getS_image());
	      // 10
	      System.out.println(hospitalMember.getH_image());
	      // 11
	      System.out.println(hospitalMember.getType());
	      //12
	      System.out.println(hospitalMember.getPersonAddress());
	      // 13
	      System.out.println(hospitalMember.getPersonBirth());
	      // 14
	      System.out.println(hospitalMember.getPersonSex());
	      String SQL = "insert into HospitalMember(personId, personPw, personEmail, personName, personAddress, personBirth, personPhone,  PersonSex, hospitalName, hospitalAddress, hospitalPhone, s_image,  h_image, type) " +
	                "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	      template.update(SQL, hospitalMember.getPersonId(), hospitalMember.getPersonPw(), hospitalMember.getPersonEmail(), hospitalMember.getPersonName(), hospitalMember.getPersonAddress(), hospitalMember.getPersonBirth(), 
	                   hospitalMember.getPersonPhone(), hospitalMember.getPersonSex(), hospitalMember.getHospitalName(), hospitalMember.getHospitalAddress(), hospitalMember.getHospitalPhone(),
	                   hospitalMember.getS_image(), hospitalMember.getH_image(), hospitalMember.getType() );
	   }
	    // 전체 db에 데이터를 넣어주는 함수
	   @Override
	   public void H_setAllMember(HospitalMember hospitalMember) {
	      String SQL = "insert into Person values(?,?,?,?,?,?,?,?,?,?)";
	      template.update(SQL, hospitalMember.getPersonId(), hospitalMember.getPersonPw(), hospitalMember.getPersonEmail(), hospitalMember.getPersonAddress(),
	            hospitalMember.getPersonName(), hospitalMember.getPersonBirth(), hospitalMember.getPersonSex(), hospitalMember.getPersonPhone(),hospitalMember.getType(),hospitalMember.getImage());
	   }


	   // 체험단 manager 회원가입 하는 함수
	@Override
	public void addEx_Manager(Ex_manager ex_manager) {
		 String SQL = "insert into Ex_Manager values(?,?,?,?,?,?,?)";
		 template.update(SQL,ex_manager.getPersonId(), ex_manager.getPersonPw(), ex_manager.getS_image(), ex_manager.getEx_Name(), ex_manager.getEx_Phone(),
				 ex_manager.getEx_Address(), ex_manager.getType() );
		
	}
	 // 전체 db에 데이터를 넣어주는 함수
	@Override
	public void setEx_AllMember(Ex_manager ex_manager) {
		 String SQL = "insert into Person values(?,?,?,?,?,?,?,?,?,?)";
		 template.update(SQL,ex_manager.getPersonId(), ex_manager.getPersonPw(), ex_manager.getPersonEmail(), ex_manager.getPersonAddress(), ex_manager.getPersonName(),
				 ex_manager.getPersonBirth(), ex_manager.getPersonSex(), ex_manager.getPersonPhone(), ex_manager.getType(), ex_manager.getC_image());
	}


	   
	   
}