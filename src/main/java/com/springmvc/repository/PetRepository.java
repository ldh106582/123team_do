package com.springmvc.repository;

import com.springmvc.domain.Pet;

public interface PetRepository {
	Pet setcreatepet(Pet pet);
	Pet getUpdatePet(String pet);
	void SetUpdatePet(Pet updatepet);
	void GetDeletePet(String petid);
	Pet getUpdatePet(Pet updatepet);
}
