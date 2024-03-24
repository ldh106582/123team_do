package com.springmvc.service;

import com.springmvc.domain.Pet;

public interface PetService {
	Pet setcreatepet(Pet pet);
	Pet getUpdatePet(String pet);
	void SetUpdatePet(Pet updatepet);
	void GetDeletePet(String petid);
	Pet getupdatepet(Pet updatepet);
}
