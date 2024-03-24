package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Pet;
import com.springmvc.repository.PetRepository;

@Service
public class PetServiceImp implements PetService{
	
	@Autowired
	private PetRepository petRepository;

	@Override
	public Pet setcreatepet(Pet pet) {
		return petRepository.setcreatepet(pet);
	}

	@Override
	public Pet getUpdatePet(String pet) {
		// TODO Auto-generated method stub
		return petRepository.getUpdatePet(pet);
	}

	@Override
	public void SetUpdatePet(Pet updatepet) {
		// TODO Auto-generated method stub
		petRepository.SetUpdatePet(updatepet);
	}

	@Override
	public void GetDeletePet(String petid) {
		// TODO Auto-generated method stub
		petRepository.GetDeletePet(petid);
	}

	@Override
	public Pet getupdatepet(Pet updatepet) {
		// TODO Auto-generated method stub
		return petRepository.getUpdatePet(updatepet);
	}
	
	
	

}
