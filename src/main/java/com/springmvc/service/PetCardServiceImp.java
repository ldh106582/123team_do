package com.springmvc.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Pet;
import com.springmvc.domain.PetChart;
import com.springmvc.domain.PetSurgery;
import com.springmvc.domain.PetVaccination;
import com.springmvc.domain.PetWeight;
import com.springmvc.repository.PetCardRepository;
import com.springmvc.repository.PetSurgeryAfter;

@Service
public class PetCardServiceImp implements PetCardService{

	@Autowired
	private PetCardRepository petCardRepository;
	
	// 반려동물의 정보를 가져오는 함수
	@Override
	public Pet getPetRead(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getPetRead(petId);
	}

	@Override
	public List<PetWeight> getReadPetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getReadPetCard(petId);
	}

	
	// 동물의 정보를 가져오는 함수
	@Override
	public Pet getPetList(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getPetList(petId);
	}

	// 동물의 몸무게를 가져오는 함수
	@Override
	public List<PetWeight> getWeghitPetCard(String petId) {
		return petCardRepository.getWeghitPetCard(petId);
	}

	// 동물의 진료 기록을 가져오는 함수	
	@Override
	public List<PetChart> getChartPetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getChartPetCard(petId);
	}
	
	// 동물의 예방접종 기록을 가져오는 함수
	@Override
	public List<PetVaccination> getVaccinationPetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getVaccinationPetCard(petId);
	}
	
	// 동물의 수술기록을 가져오는 함수
	@Override
	public List<PetSurgery> getPetSurgery(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getPetSurgery(petId);
	}

	// 동물의 입원기록을 가져오는 함수
	@Override
	public List<PetSurgeryAfter> getPetSurgeryAfter(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getPetSurgeryAfter(petId);
	}
	
	// 동물의 몸무게를 넣어주는 함수
	@Override
	public void setWeghitPetCard(PetWeight petWeight) {
		
		petCardRepository.setWeghitPetCard(petWeight);
	}
	
	// 진료 기록을 넣어주는 함수
	@Override
	public void setChartPetCard(PetChart petChart) {
		// TODO Auto-generated method stub
		petCardRepository.setChartPetCard(petChart);
	}
	
	// 예방접종 기록을 넣어주는 함수
	@Override
	public void setVaccinationPetCard(PetVaccination petVaccination) {
		// TODO Auto-generated method stub
		petCardRepository.setVaccinationPetCard(petVaccination);
	}
	
	// 수술 기록을 넣어주는 함수
	@Override
	public void setPetSurgery(PetSurgery petSurgery) {
		// TODO Auto-generated method stub
		petCardRepository.setPetSurgery(petSurgery);
	}

	// 입원 기록을 넣어주는 함수
	@Override
	public void setPetSurgeryAfter(PetSurgeryAfter petSurgeryAfter) {
		// TODO Auto-generated method stub
		petCardRepository.setPetSurgeryAfter(petSurgeryAfter);
	}

	// 동물의 몸무게를 제거하는 함수
	@Override
	public void getDeleteWeghitPetCard(String petid, int petWeightNumInt) {
		// TODO Auto-generated method stub
		petCardRepository.getDeleteWeghitPetCard(petid, petWeightNumInt);
	}

	// 동물의 진료 기록을 삭제하는 함수
	@Override
	public void getDeletePetCard(String petid, int petChartNumInt) {
		// TODO Auto-generated method stub
		petCardRepository.getDeletePetCard(petid, petChartNumInt);
	}

	// 동물의 백신기록을 제거하는 함수
	@Override
	public void getDeleteVaccinationPetCard(String petid, int petVaccinationNumInt) {
		// TODO Auto-generated method stub
		petCardRepository.getDeleteVaccinationPetCard(petid, petVaccinationNumInt);
	}
	
	// 동물의 수술기록을 삭제하는 함수
	@Override
	public void getDeleteSurgeryPetCard(String petid, int petSurgeryNumInt) {
		// TODO Auto-generated method stub
		petCardRepository.getDeleteSurgeryPetCard(petid, petSurgeryNumInt);
	}
	
	// 동물의 입원 기록을 삭제하는 함수
	@Override
	public void getDeleteSurgeryAfterPetCard(String petid, int petSurgeryAfterNumInt) {
		// TODO Auto-generated method stub
		petCardRepository.getDeleteSurgeryAfterPetCard(petid, petSurgeryAfterNumInt);
	}
	
	// 정보를 수정하기 전 동물의 정보를 보여주는 함수
	@Override
	public Pet getUpdatePetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getUpdatePetCard(petId);
	}
	
	//  정보를 수정하기 전 몸무게 데이터를 보여주는 함수
	@Override
	public List<PetWeight> getUpdateWeightPetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getUpdateWeightPetCard(petId);
	}
	//  정보를 수정하기 전 진료 데이터를 보여주는 함수
	@Override
	public List<PetChart> getChartUpdatePetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getChartUpdatePetCard(petId);
	}
    //  정보를 수정하기 전 예방접종 데이터를 보여주는 함수
	@Override
	public List<PetVaccination> getVaccinationUpdatePetCard(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getVaccinationUpdatePetCard(petId);
	}
	//  정보를 수정하기 전 수술 데이터를 보여주는 함수
	@Override
	public List<PetSurgery> getUpdatePetSurgery(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getUpdatePetSurgery(petId);
	}
	//  정보를 수정하기 전 입원 데이터를 보여주는 함수
	@Override
	public List<PetSurgeryAfter> getUpdatePetSurgeryAfter(String petId) {
		// TODO Auto-generated method stub
		return petCardRepository.getUpdatePetSurgeryAfter(petId);
	}
	
	
	
	// 동물의 진료 기록을 수정하는 함수

	@Override
	public void setUpdateWeightPetCard(PetWeight petWeight) {
		// TODO Auto-generated method stub
		petCardRepository.setUpdateWeightPetCard(petWeight);
	}
	
	// 동물의 진료 기록을 수정하는 함수
	@Override
	public void setUpdateChartPetCard(PetChart petChart) {
		// TODO Auto-generated method stub
		petCardRepository.setUpdateChartPetCard(petChart);
	}
	
	//  동물의 예방접종 기록을 수정하는 함수
	@Override
	public void setUpdateVaccinationPetCard(PetVaccination petVaccination) {
		// TODO Auto-generated method stub
		petCardRepository.setUpdateVaccinationPetCard(petVaccination);
	}

	@Override
	public void setUpdateSergeryionPetCard(PetSurgery petSurgery) {
		// TODO Auto-generated method stub
		petCardRepository.setUpdateSergeryionPetCard(petSurgery);
	}

	@Override
	public void setUpdateSergeryAfterPetCard(PetSurgeryAfter petSurgeryAfter) {
		// TODO Auto-generated method stub
		petCardRepository.setUpdateSergeryAfterPetCard(petSurgeryAfter);
	}
	
	// 아래는 다시 돌아가는 것들 모음
	@Override
	public List<Pet> petcardback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardback(petid);
	}

	@Override
	public List<PetWeight> petcardWheightback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardWheightback(petid);
	}

	@Override
	public List<PetChart> petcardChartback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardChartback(petid);
	}

	@Override
	public List<PetVaccination> petcardVaccinationback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardVaccinationback(petid);
	}

	@Override
	public List<PetSurgery> petcardSurgeryback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardSurgeryback(petid);
	}

	@Override
	public List<PetSurgeryAfter> petcardSurgeryAfterback(String petid) {
		// TODO Auto-generated method stub
		return petCardRepository.petcardSurgeryAfterback(petid);
	}
	
	
	
	


	

	

	
	
	
	
}
