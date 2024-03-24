package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Pet;
import com.springmvc.domain.PetChart;
import com.springmvc.domain.PetSurgery;
import com.springmvc.domain.PetVaccination;
import com.springmvc.domain.PetWeight;

public interface PetCardRepository {
	// 반려동물의 정보를 가져오는 함수
	Pet getPetRead(String petId);
	
	List<PetWeight> getReadPetCard(String petId);
	// 동물의 몸무게를 가져오는 함수
	List<PetWeight> getWeghitPetCard(String petId);
	// 동물의 진료를 가져오는 함수
	List<PetChart> getChartPetCard(String petId);
	// 예방접종 데이터를 가져옴
	List<PetVaccination> getVaccinationPetCard(String petId);
	// 동물의 수술데이터를 가져옴
	List<PetSurgery> getPetSurgery(String petId);
	// 도물의 입원데이터를 가져옴
	List<PetSurgeryAfter> getPetSurgeryAfter(String petId);
	
	// 동물의 정보를 가져오는 함수
	Pet getPetList(String petId);
	
	// 동물의 몸무게를 넣어주는 함수
	void setWeghitPetCard(PetWeight petWeight);
	
	// 진료 기록을 넣어주는 함수
	void setChartPetCard(PetChart petChart);
	 
	// 예방접종 기록을 넣어주는 함수
	void setVaccinationPetCard(PetVaccination petVaccination);
	
	// 수술 기록을 넣어주는 함수
	void setPetSurgery(PetSurgery petSurgery);
	
	// 입원 기록을 넣어주는 함수
	void setPetSurgeryAfter(PetSurgeryAfter petSurgeryAfter);

	// 동물의 몸무게를 제거하는 함수
	void getDeleteWeghitPetCard(String petid, int petWeightNumInt);
	
	// 동물의 진료 기록을 삭제하는 함수
	void getDeletePetCard(String petid, int petChartNumInt);
	
	// 동물의 백신기록을 제거하는 함수
	void getDeleteVaccinationPetCard(String petid, int petVaccinationNumInt);
	
	// 동물의 수술기록을 삭제하는 함수
	void getDeleteSurgeryPetCard(String petid, int petSurgeryNumInt);
	
	// 동물의 입원 기록을 삭제하는 함수
	void getDeleteSurgeryAfterPetCard(String petid, int petSurgeryAfterNumInt);
	
	// 정보를 수정하기 전 동물의 정보를 보여주는 함수
	Pet getUpdatePetCard(String petId);
	
	//  정보를 수정하기 전 몸무게 데이터를 보여주는 함수
	List<PetWeight> getUpdateWeightPetCard(String petId);
	
	//  정보를 수정하기 전 진료 데이터를 보여주는 함수
	List<PetChart> getChartUpdatePetCard(String petId);
	
	//  정보를 수정하기 전 예방접종 데이터를 보여주는 함수
	List<PetVaccination> getVaccinationUpdatePetCard(String petId);
	
	//  정보를 수정하기 전 수술 데이터를 보여주는 함수
	List<PetSurgery> getUpdatePetSurgery(String petId);
	
	//  정보를 수정하기 전 입원 데이터를 보여주는 함수
	List<PetSurgeryAfter> getUpdatePetSurgeryAfter(String petId);
	
	// 동물의 진료 기록을 수정하는 함수
	void setUpdateWeightPetCard(PetWeight petWeight);
	
	// 동물의 진료 기록을 수정하는 함수
	void setUpdateChartPetCard(PetChart petChart);
	
	//  동물의 예방접종 기록을 수정하는 함수
	void setUpdateVaccinationPetCard( PetVaccination petVaccination);
	
	void setUpdateSergeryionPetCard(PetSurgery petSurgery);
	
	void setUpdateSergeryAfterPetCard(PetSurgeryAfter petSurgeryAfter);
	
	//  다시 돌아가는 데이터 모음	
	List<Pet> petcardback(String petid);
	
	List<PetWeight> petcardWheightback(String petid);
	
	List<PetChart> petcardChartback(String petid);
	
	List<PetVaccination> petcardVaccinationback(String petid);
	
	List<PetSurgery> petcardSurgeryback(String petid);
	
	List<PetSurgeryAfter> petcardSurgeryAfterback(String petid);
	
	
}


