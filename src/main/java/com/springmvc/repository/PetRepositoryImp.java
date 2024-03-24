package com.springmvc.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Pet;


@Repository
public class PetRepositoryImp implements PetRepository{
	 private JdbcTemplate template;

 	@Autowired
     public void setJdbctemplate(DataSource dataSource) {
         this.template = new JdbcTemplate(dataSource);
     }
 	
 	// pet값을 넣어줌
	@Override
	public Pet setcreatepet(Pet pet) {
		System.out.println("create db 도착");
		String SQL = "insert into Pet(PetId, PetName, PetType, PetVarity, PetSex, PetBirth, PersonId, petImage) values (?,?,?,?,?,?,?,?)";
		template.update(SQL, pet.getPetId(), pet.getPetName(), pet.getPetType(), pet.getPetVarity(), pet.getPetSex(), pet.getPetBirth(), pet.getPersonId(), pet.getPetImage());
		
		return pet;
	}
	
	// petcard에 보여줄 값을 가져옴
	@Override
	public Pet getUpdatePet(String pet) {
		Pet petId = null;
		String SQL = "select count(*) from Pet where PetId=?";
		int rowNum = template.queryForObject(SQL, Integer.class, pet);
		if(rowNum != 0) {
			SQL = "select * from Pet where PetId=?";
			petId = template.queryForObject(SQL, new Object[] {pet}, new PetDBConnector());
		}
		return petId;
	}
	
	// pet 업데이트 해줌
	@Override
	public void SetUpdatePet(Pet updatepet) {
		System.out.println(updatepet.getPetImage());
		if(updatepet.getPetId() != null) {
		String SQL = "update Pet set petName=?, petVarity=?, petBirth=?, petImage=? where petId=?";
		template.update(SQL, updatepet.getPetName(), updatepet.getPetVarity(), updatepet.getPetBirth(), updatepet.getPetImage(), updatepet.getPetId());
		}else {
			System.out.println("pet 아이디가 없습니다.");
		}
	}
	
	// 다시 값을 가져가 card에 보여줌
	@Override
	public Pet getUpdatePet(Pet updatepet) {
		Pet petdate = null;
		String petSQL = "select * form Pet where PetId=?";
		petdate = template.queryForObject(petSQL, new Object[] {updatepet}, new PetDBConnector());
		return petdate;
	}
	
	// pet 삭제
	@Override
	public void GetDeletePet(String petid) {
		String SQL = "Delete from Pet where petId=?";
		this.template.update(SQL, petid);
	}
	
	
	
	
}
