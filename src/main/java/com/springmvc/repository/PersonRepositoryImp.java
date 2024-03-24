package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.springmvc.controller.ManagerController;
import com.springmvc.domain.type;
import com.springmvc.domain.EApplication;
import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.Person;
import com.springmvc.domain.Pet;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductMember;

@Repository
public class PersonRepositoryImp implements  PersonRepository{

	 public PersonRepositoryImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 private JdbcTemplate template;
	List<Person> personlist = new ArrayList<Person>();
 
	@Autowired
     public void setJdbctemplate(DataSource dataSource) {
         this.template = new JdbcTemplate(dataSource);
     }
	 
	 // create문
	@Override
	public void setCreatPerson(Person person) 
	{
		System.out.println("personrepository");
		
		String SQL = "INSERT INTO Person(PersonId, PersonPw, PersonEmail, PersonAddress, PersonName, PersonBirth,PersonSex, PersonPhone, Type, image)" + "VALUES(?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL, person.getPersonId(), person.getPersonPw(), person.getPersonEmail(), person.getPersonAddress(),
						person.getPersonName(), person.getPersonBirth(),  person.getPersonSex(), person.getPersonPhone(), person.getType(), person.getImage());
	}

	//update전 person 데이터를 보여줌
	@Override
	public Person loginSucess(Person person) {
		Person personID = null;
		
		String SQL =  "select count(*) from Person where PersonId=?";
		int rowNum = template.queryForObject(SQL, Integer.class, person.getPersonId());
		System.out.println("personUpdate : " + rowNum);
		
		if(rowNum != 0) {
			SQL = "select * from Person where PersonId=?";
			personID = template.queryForObject(SQL, new Object[] {person.getPersonId()}, new PersonDBConnector());
		} 
		
		if(personID == null) {
			System.out.println("여기에는 도착하는가?");
			String persnId = null;
			return personID;
			
		} else 
		
		{
			return personID;			
		}
	}

	// update 수정한 값을 db에 넣음
	@Override
	public void SetUpdatePerson(Person person) {
		if(person.getPersonId()!=null) {
			 String SQL = "update Person set personPw = ?, personEmail = ?, personAddress = ?, personName = ?, personBirth = ?, personSex = ?,  personPhone = ?, image=? where personId = ?";
		     template.update(SQL, person.getPersonPw(), person.getPersonEmail(), person.getPersonAddress(),
		    		 			person.getPersonName(), person.getPersonBirth(), person.getPersonSex(), person.getPersonPhone(), person.getImage(), person.getPersonId());
		}else {
				System.out.println("person 아이디가 없습니다.");
		}
	}
	
	// delete 아이디를 삭제하는함수
	@Override
	public void SetDeletePerson(String personId) {
		String SQL = "delete from Person where personId=?";
		this.template.update(SQL, personId);
	}

	// pet 주인의 id값을 가져온 후 pet db에서 이름을 가져옴
	@Override
	public List<Pet> getPetName(Person person) {
		List<Pet> petList = new ArrayList<Pet>();
		
		String SQL = "select count(*) from Pet where personId=?";
		Integer petCount = template.queryForObject(SQL, new Object[] {person.getPersonId()}, Integer.class);
		System.out.println("petCount : " + petCount);

	    String SQLPersonId = "select * from Pet where personId=?";
	    List<Pet> pet = template.query(SQLPersonId, new Object[] {person.getPersonId()}, new PetDBConnector());
	    petList.addAll(pet);
			
		return petList;
	}
	// 동물의 정보를 수정하기 전 정보를 보여주는 함수
	@Override
	public List<Pet> getPetId(Pet pet) {
		List<Pet> petList = new ArrayList<Pet>();
		String SQLPersonId = "select * from Pet where personId=?";
		petList = template.query(SQLPersonId, new Object[] {pet.getPersonId()}, new PetDBConnector());
		
		return petList;
	}
	
	// update에서 사용할 정보
	@Override
	public Person findPersonById(String id) {
		String SQL = "select count(*) from Person where PersonId=?";
		Integer perCount = template.queryForObject(SQL, Integer.class, id);
		
		System.out.println("perCount : " + perCount);
		Person personId = null;
		if(perCount != 0) {
			
			String personSQL = "select * from Person where personId=?";
			personId = template.queryForObject(personSQL, new Object[] {id}, new PersonDBConnector());
		} else {
			System.out.println("데이터가 없습니다.");
		}
		return personId;
	}
	// 프로덕트 매니저가 로그인할 때 가져올 데이터
	@Override
	public ProductMember getPM(String personId) {
		String SQL = "select count(*) from ProductMember where personId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		ProductMember productMember = null;
		if(intNum != 0) {
			SQL = "select * from ProductMember where personId=?";
			
			return template.queryForObject(SQL, new Object[] {personId}, new ProductMemberDBConnector());
		}
		System.out.println("pm정보가 존재하지 않습니다.");
		return null;
	}
	// 해당 프로덕트 매니저의 상품을 가죠오는 데이터
	@Override
	public List<Product> getProduct(String personId) {
		String SQL = "select * from Product where personId = ?";
		//return template.query(SQL, new Object[] {personId}, new ProductDBConnector());
		return template.query(SQL, new Object[] {personId}, new ProductRowMapper());
	}
	
	// 동물병원 의사가 로그인할 때 가져올 데이터

	@Override
	public HospitalMember getHM(String personId) {
		String SQL = "select count(*) from HospitalMember where personId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != 0) {
			HospitalMember hospitalMember = null;
			SQL = "select * from HospitalMember where personId=?";
			hospitalMember = template.queryForObject(SQL, new Object[] {personId}, new HospitalManagerDBConnector());
			return hospitalMember;
	}
		System.out.println("Hm정보가 존재하지 않습니다.");
		
		return null;
	}
	// 해당 동물병원의사의 병원정보를 가죠오는 데이터
	@Override
	public List<Hospital> getHopital(String personId) {
		String SQL = "select * from hospital where personId = ?";
		List<Hospital> listOfHospital = template.query(SQL, new Object[] {personId}, new HospitalRowMapper());
		return listOfHospital;
	}
	
	
	// product manager 테이블을 수정하는 곳
	@Override
	public void SetUpdatePr(ProductMember productMember) {
		System.out.println(" ㅇㅇㅇㅇㅇ");
		System.out.println("여기는 productMember : " + productMember.getPersonId());
		System.out.println("여기는 productMember s_image : " + productMember.getS_image());
		if(productMember.getPersonId()!=null) {
			 String SQL = "update ProductMember set PersonPw=?, PersonEmail=?, PersonAddress=? ,PersonName=?, PersonBirth=?, PersonSex=? , PersonPhone=?, CompanyName=?, CompanyAddress=?, CompanyPhone=?, s_image=?, c_image=? where personId=?";
			 template.update(SQL, productMember.getPersonPw(), productMember.getPersonEmail(), productMember.getPersonAddress(), productMember.getPersonName(),
					 productMember.getPersonBirth(), productMember.getPersonSex(), productMember.getPersonPhone(),
					 productMember.getCompanyName(), productMember.getCompanyAddress(),productMember.getCompanyPhone(),
					 productMember.getS_image(), productMember.getC_image(), productMember.getPersonId());
		}
	}
	// productMember manager person을 수정하는 곳
	@Override
	public void SetUpdatePM(ProductMember productMember) {

			 String SQL = "update person set PersonPw=?, PersonEmail=?, PersonAddress=? ,PersonName=?, PersonBirth=?, PersonSex=?, PersonPhone=?, image=?  where PersonId=?";
	         template.update(SQL, productMember.getPersonPw(), productMember.getPersonEmail(), productMember.getPersonAddress(), productMember.getPersonName(),
	        		 		productMember.getPersonBirth(), productMember.getPersonSex(), productMember.getPersonPhone(), productMember.getS_image(),productMember.getPersonId());
	}
	
	 // hospital manager 테이블을 수정하는 곳
	@Override
	public void SetUpdateHM(HospitalMember hospitalMember) {
			String SQL = "update HospitalMember set PersonPw=?, PersonEmail=?, PersonAddress=?, PersonName=?, personPhone=?, PersonBirth=?, PersonSex=?, hospitalName=?, hospitalAddress=?, hospitalPhone=?, s_image=? where PersonId=?";
			template.update(SQL, hospitalMember.getPersonPw(), hospitalMember.getPersonEmail(), hospitalMember.getPersonAddress(), hospitalMember.getPersonName(), hospitalMember.getPersonPhone(),
					hospitalMember.getPersonBirth(), hospitalMember.getPersonSex(), hospitalMember.getHospitalName(), hospitalMember.getHospitalAddress(), hospitalMember.getHospitalPhone(),hospitalMember.getS_image(), hospitalMember.getPersonId());
	}

	 // hospital manager person 테이블을 수정하는 곳
	@Override
	public void SetUpdatePH(HospitalMember hospitalMembers) {
		if(hospitalMembers.getPersonId()!=null) {
			  String SQL = "update person set PersonPw=?, PersonEmail=?, PersonAddress=? ,PersonName=?, PersonBirth=?, PersonSex=?, PersonPhone=?, image=?  where PersonId=?";
	          template.update(SQL, hospitalMembers.getPersonPw(), hospitalMembers.getPersonEmail(), hospitalMembers.getPersonAddress(), hospitalMembers.getPersonName(),
	                  hospitalMembers.getPersonBirth(), hospitalMembers.getPersonSex(), hospitalMembers.getPersonPhone(), hospitalMembers.getS_image() ,hospitalMembers.getPersonId());
		}
		System.out.println("null?");
		
	}
	
    // 체험단 관리자가 로그인할 때 가져올 데이터
	@Override
	public Person getEM(String personId) {
		String SQL = "select count(*) from Person where personId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		System.out.println(intNum);
		Person ex_person  = null;
		if(intNum != 0) {
			SQL = "select * from Person where personId = ?";
			ex_person= template.queryForObject(SQL, new Object[] {personId}, new PersonDBConnector());
			return ex_person;
		}
		return null;
	}
	// 체험단 신청목록을 로그인할 때 가져올 데이터
	@Override
	public List<EApplication> getEA(String personId) {
		List<EApplication> listOfEA = new ArrayList<EApplication>();
		String SQL = "select * from EApllication where Mid = ?";
		listOfEA = template.query(SQL, new Object[] {personId}, new EApplicationRowMapper());
		return listOfEA;
	}

	@Override
	public ProductMember P_update(String id) {
		System.out.println("id : " + id);
		String SQL = "select count(*) from ProductMember where personId = ?";
		Integer intNum = template.queryForObject(SQL, Integer.class, id);
		System.out.println("intNum" + intNum);
		if(intNum != 0) {
		SQL = "select * from ProductMember where personId = ?";
		ProductMember productMember = null;
		productMember = template.queryForObject(SQL, new Object[] {id}, new ProductMemberDBConnector());
		return productMember;
		} else {
			System.out.println("해당 id가 존재하지 않습니다.");
			return null;
		}

	}

	@Override
	public HospitalMember H_update(String id) {
		String SQL = "select * from HospitalMember where personId = ?";
		HospitalMember hospitalMember =null;
		hospitalMember = template.queryForObject(SQL, new Object[] {id}, new HospitalManagerDBConnector());
		return hospitalMember;
	}

	@Override
	public Ex_manager E_update(String id) {
		System.out.println("id" + id);
		String SQL = "select * from Ex_Manager where personId = ?";
		System.out.println("id2 : " + id);
		Ex_manager ex_manager = null;
		System.out.println("id3 : " + id);
		ex_manager = template.queryForObject(SQL, new Object[] {id}, new ex_managerDBConnector());
		System.out.println("ex_manager : " + ex_manager);
		return ex_manager;
	}

	@Override
	public void SetUpdateEM(Ex_manager ex_manager) {
		for(int i = 0; i < 1; i++) {
		String SQL = "update Ex_Manager set personPw=?,  s_image=?, ex_name=?, ex_phone=?,ex_Address=?,  Type=? where PersonId=?";
		template.update(SQL, ex_manager.getPersonPw(), ex_manager.getS_image(), ex_manager.getEx_Name(), ex_manager.getEx_Phone(), ex_manager.getEx_Address(),ex_manager.getType(), ex_manager.getPersonId());
		
		String SQL1 = "update Person set PersonPw=?, PersonEmail=?, PersonAddress=?, PersonName=?, PersonBirth=?, PersonSex=?, PersonPhone=? where PersonId=?";
		template.update(SQL1, ex_manager.getPersonPw(), ex_manager.getPersonEmail(), ex_manager.getPersonAddress(), ex_manager.getPersonName(), ex_manager.getPersonBirth(), ex_manager.getPersonSex() ,ex_manager.getPersonPhone(), ex_manager.getPersonId());
		
		}
	}
	//product manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	@Override
	public void PM(String personId) {
		for(int i = 0; i < 1; i++) {
			String SQL = "delete from person where personId=?";
			template.update(SQL, new Object[] {personId}, new PersonDBConnector());
			String SQL1= "delete from ProductMember where personId=?";
			template.update(SQL1, new Object[] {personId}, new ProductMemberDBConnector());
		}
		
	}
	  //병원 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	@Override
	public void HM(String personId) {
		for(int i = 0; i < 1; i++) {
			String SQL = "delete from person where personId=?";
			template.update(SQL, new Object[] {personId}, new PersonDBConnector());
			String SQL1= "delete from HospitalMember where personId=?";
			template.update(SQL1, new Object[] {personId}, new HospitalManagerDBConnector());
		}
		
	}
	  //체험단 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수

	@Override
	public void EM(String personId) {
		for(int i = 0; i < 1; i++) {
			String SQL = "delete from person where personId=?";
			template.update(SQL, new Object[] {personId}, new PersonDBConnector());
			String SQL1= "delete from Ex_Manager where personId=?";
			template.update(SQL1, new Object[] {personId}, new ex_managerDBConnector());
		}
		
	}
	  // mypage수정시  redirect 하는 함수
	@Override
	public Person getMypage(String personId) {
		String SQL = "select * from person where personId=?";
		int rowNum = template.queryForObject(SQL, Integer.class, personId);
		
		Person person;
		if(rowNum != 0) {
			person = template.queryForObject(SQL, new Object[] {personId}, new PersonDBConnector());
			System.out.println(person.getImage());
			System.out.println(person.getPersonId());
			System.out.println(person.getPersonEmail());
			System.out.println(person.getPersonName());
			System.out.println(person.getPersonPhone());
			System.out.println(person.getPersonPw());
			return person;
		} else {
			System.out.println("해당하는 아이디가 없습니다.");
			return null;
		}
	}
	






}
