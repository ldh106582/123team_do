package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.springmvc.domain.Pet;
import com.springmvc.domain.PetChart;
import com.springmvc.domain.PetSurgery;
import com.springmvc.domain.PetVaccination;
import com.springmvc.domain.PetWeight;

@Repository
public class PetCardRepositoryImp implements PetCardRepository{
   
    public PetCardRepositoryImp() {
      super();
      // TODO Auto-generated constructor stub
   }

   private JdbcTemplate template;

    @Autowired
        public void setJdbctemplate(DataSource dataSource) {
            this.template = new JdbcTemplate(dataSource);
        }

    List<PetWeight> listOfPetCard = new ArrayList<PetWeight>();
    
    
    
    // 1. 도현_반려동물 이름과 id를 가져옴
   @Override
   public Pet getPetRead(String petId) {
      
      String SQL = "select * from Pet where PetId=?";
      Pet petName = template.queryForObject(SQL, new Object[] {petId}, new PetDBConnector());
      System.out.println("확인 : " + petName.getPetImage());
      System.out.println("petName : " + petName);
      return petName;
   }
   
   //  2. 도현_반려동물 진료 기록 가져옴
   @Override
   public List<PetWeight> getReadPetCard(String petId) {
      String SQL = "select * from PetWeight inner join Pet on PetWeight.PetId =  Pet.PetId;";
       List<PetWeight> petName = template.query(SQL, new Object[] {petId}, new PetWeightDBConnector());
       return petName;
   }
   
   // 도현_동물의 몸무게를 가져오는 함수
   @Override
   public List<PetWeight> getWeghitPetCard(String petId) {

   		String SQL = "select * from PetWeight where petId=?";
   	  	List<PetWeight> listOfPetWeight = template.query(SQL, new Object[] {petId}, new PetWeightDBConnector());    	 
   	  	System.out.println(listOfPetWeight);
   	  	return listOfPetWeight;
     }
   
   // 도현_반려동물 진료 기록을 가져옴
   @Override
   public List<PetChart> getChartPetCard(String petId) {
      String SQL = "select * from PetChart where PetId=?";
      List<PetChart> listOfPetChart = template.query(SQL, new Object[] {petId}, new PetChartDBConnector());
      System.out.println("차트 출력확인 : " + listOfPetChart);
      return listOfPetChart;
   }
   
   // 도현_예방 접종 기록을 가져옴
   @Override
   public List<PetVaccination> getVaccinationPetCard(String petId) {
      String SQL = "select * from PetVaccination where PetId=?";
      List<PetVaccination> listOfpetVaccination = template.query(SQL, new Object[] {petId}, new PetVaccinationDBConnector());
      return listOfpetVaccination;
   }
   
   // 도현_반려동물의 수술 기록을 가져옴
   @Override
   public List<PetSurgery> getPetSurgery(String petId) {
      String SQL = "select * from PetSurgery where PetId=?";
      List<PetSurgery> listOfPetSurgery = template.query(SQL, new Object[] {petId}, new PetSurgeryDBConnector());
      return listOfPetSurgery;
   }
   
   // 도현_동물의 입원 기록을 가져옴
   @Override
   public List<PetSurgeryAfter> getPetSurgeryAfter(String petId) {
      String SQL = "select * from PetSurgeryAfter where PetId=?";
      List<PetSurgeryAfter> listOfPetSurgeryAfter = template.query(SQL, new Object[] {petId}, new PetSurgeryAfterDBConnector());
      return listOfPetSurgeryAfter;
   }
   
   // 도현_동물의 정보를 가져오는 함수
   @Override
   public Pet getPetList(String petId) {
      String SQL = "select * from Pet where PetId=?";
      Pet petList = template.queryForObject(SQL, new Object[] {petId}, new PetDBConnector());

       return petList;
   }

   // 도현_동물의 몸무게를 넣는 함수
    @Override
    public void setWeghitPetCard(PetWeight petWeight) { 
       String SQL ="insert into PetWeight(PetWeightNum ,PetWeightDate, PetWeight, PetId) values(?,?,?,?)";
       template.update(SQL, new Object[] {petWeight.getPetWeightNum(), petWeight.getPetWeightDate(), petWeight.getPetWeight(), petWeight.getPetId()}); 
    }

   // 도현_동물의 진료기록을 넣는 함수
   @Override
   public void setChartPetCard(PetChart petChart) {
       String SQL ="insert into PetChart(PetChartNum ,petChartDate , petChart, petChartContent , PetId ) values(?,?,?,?,?)";
       template.update(SQL, new Object[] {petChart.getPetChartNum(), petChart.getPetChartDate(),  petChart.getPetChart(), petChart.getPetChartContent(), petChart.getPetId()});
   }

   // 도현_동물의 예방접종기록을 넣는 함수
   @Override
   public void setVaccinationPetCard(PetVaccination petVaccination) {
       String SQL ="insert into petVaccination(petVaccinationNum ,petVaccinationDate  , petVaccination , petVaccinationCotent  , PetId ) values(?,?,?,?,?)";
       template.update(SQL, new Object[] {petVaccination.getPetVaccinationNum(), petVaccination.getPetVaccinationDate(), petVaccination.getPetVaccination(), petVaccination.getPetVaccinationCotent(),   petVaccination.getPetId()});
   }

   // 도현_동물의 수술기록을 넣는 함수
   @Override
   public void setPetSurgery(PetSurgery petSurgery) {
      String SQL ="insert into PetSurgery(PetSurgeryNum ,PetSurgeryDate  , PetSurgeryName , PetSurgeryContent  , PetId ) values(?,?,?,?,?)";
       template.update(SQL, new Object[] {petSurgery.getPetSurgeryNum(), petSurgery.getPetSurgeryDate(), petSurgery.getPetSurgeryName(),  petSurgery.getPetSurgeryContent(),  petSurgery.getPetId()});
   }

   // 도현_동물의 입원기록을 넣는 함수
   @Override
   public void setPetSurgeryAfter(PetSurgeryAfter petSurgeryAfter) {
      String SQL ="insert into PetSurgeryAfter(PetSurgeryAfterNum ,PetSurgeryAfterDate , PetSurgeryAfterContent, PetId ) values(?,?,?,?)";
       template.update(SQL, new Object[] {petSurgeryAfter.getPetSurgeryAfterNum(), petSurgeryAfter.getPetSurgeryAfterDate(), petSurgeryAfter.getPetSurgeryAfterContent(),  petSurgeryAfter.getPetId()});
   }

   // 도현_동물의 몸무게를 제거하는 함수
   @Override
   public void getDeleteWeghitPetCard(String petid, int petWeightNumInt) {
      String SQL ="delete from PetWeight where PetId=? and PetWeightNum=?";
      this.template.update(SQL, petid, petWeightNumInt);
      
   }
   
   // 도현_동물의 진료 기록을 삭제하는 함수
   @Override
   public void getDeletePetCard(String petid, int petChartNumInt) {
      String SQL ="delete from PetChart where PetId=? and PetChartNum=?";
      this.template.update(SQL, petid, petChartNumInt);
   } 
   
   // 도현_동물의 백신기록을 제거하는 함수
   @Override
   public void getDeleteVaccinationPetCard(String petid, int petVaccinationNumInt) {
      String SQL ="delete from petVaccination where PetId=? and PetVaccinationNum=?";
      this.template.update(SQL, petid, petVaccinationNumInt);
      
   }
   // 도현_동물의 수술기록을 삭제하는 함수
   @Override
   public void getDeleteSurgeryPetCard(String petid, int petSurgeryNumInt) {
      String SQL ="delete from PetSurgery where PetId=? and PetSurgeryNum=?";
      this.template.update(SQL, petid, petSurgeryNumInt);
      
   }
   
   // 도현_동물의 입원 기록을 삭제하는 함수
   @Override
   public void getDeleteSurgeryAfterPetCard(String petid, int petSurgeryAfterNumInt) {
      String SQL ="delete from PetSurgeryAfter where PetId=? and PetSurgeryAfterNum=?";
      this.template.update(SQL, petid, petSurgeryAfterNumInt);
   }

   // 도현_정보를 수정하기 전 동물의 정보를 보여주는 함수
   @Override
   public Pet getUpdatePetCard(String petId) {

      String SQL = "select * from Pet where PetId=?";
      Pet pet = template.queryForObject(SQL, new Object[] {petId}, new PetDBConnector());
      return pet;
   }
   //  도현_정보를 수정하기 전 몸무게 데이터를 보여주는 함수
   @Override
   public List<PetWeight> getUpdateWeightPetCard(String petId) {
      String SQL = "select * from PetWeight where PetId=?";
      List<PetWeight> petWeight = template.query(SQL, new Object[] {petId}, new PetWeightDBConnector());
      System.out.println("petWeight update : " + petWeight);
      return petWeight;
   }

   //  도현_정보를 수정하기 전 진료 데이터를 보여주는 함수
   @Override
   public List<PetChart> getChartUpdatePetCard(String petId) {
      String SQL = "select * from PetChart where PetId=?";
      List<PetChart> PetChart = template.query(SQL, new Object[] {petId}, new PetChartDBConnector());
      return PetChart;
   }
   //  도현_정보를 수정하기 전 예방접종 데이터를 보여주는 함수
   @Override
   public List<PetVaccination> getVaccinationUpdatePetCard(String petId) {
      String SQL = "select * from petVaccination where PetId=?";
      List<PetVaccination> petVaccination = template.query(SQL, new Object[] {petId}, new PetVaccinationDBConnector());
      return petVaccination;
   }
   //  도현_정보를 수정하기 전 수술 데이터를 보여주는 함수
   @Override
   public List<PetSurgery> getUpdatePetSurgery(String petId) {
      String SQL = "select * from PetSurgery where PetId=?";
      List<PetSurgery> petSurgery = template.query(SQL, new Object[] {petId}, new PetSurgeryDBConnector());
      return petSurgery;
   }
   //  도현_정보를 수정하기 전 입원 데이터를 보여주는 함수
   @Override
   public List<PetSurgeryAfter> getUpdatePetSurgeryAfter(String petId) {
      String SQL = "select * from PetSurgeryAfter where PetId=?";
      List<PetSurgeryAfter> petSurgeryAfter = template.query(SQL, new Object[] {petId}, new PetSurgeryAfterDBConnector());
      return petSurgeryAfter;
   }
   
   // 도현_동물의 진료 기록을 수정하는 함수
   @Override
   public void setUpdateWeightPetCard(PetWeight petWeight) {
      String SQL = "update PetWeight set  PetWeightDate=?, PetWeight=? where PetWeightNum  = ?";
      template.update(SQL,petWeight.getPetWeightDate(), petWeight.getPetWeight(), petWeight.getPetWeightNum()) ;
   }

   // 도현_동물의 진료 기록을 수정하는 함수
   @Override
   public void setUpdateChartPetCard(PetChart petChart) {
      System.out.println(petChart.getPetChartNum());
      String SQL = "update PetChart set  petChartDate =?, petChart=?, petChartContent =?  where PetChartNum  =?";
      template.update(SQL, petChart.getPetChartDate(), petChart.getPetChart(), petChart.getPetChartContent(), petChart.getPetChartNum());
      
   }
   
   //  도현_동물의 예방접종 기록을 수정하는 함수
      @Override
      public void setUpdateVaccinationPetCard(PetVaccination petVaccination) {
          String SQL = "update PetVaccination set petVaccinationDate =?, petVaccination=?, petVaccinationCotent =?  where petVaccinationNum  =?";
          template.update(SQL, petVaccination.getPetVaccinationDate(), petVaccination.getPetVaccination(), petVaccination.getPetVaccinationCotent(), petVaccination.getPetVaccinationNum());
      }

      @Override
      public void setUpdateSergeryionPetCard(PetSurgery petSurgery) {
          String SQL = "update PetSurgery set PetSurgeryDate =?, PetSurgeryName=?, PetSurgeryContent =?  where PetSurgeryNum  =?";
             template.update(SQL, petSurgery.getPetSurgeryDate(), petSurgery.getPetSurgeryName(), petSurgery.getPetSurgeryContent(), petSurgery.getPetSurgeryNum());
         
      }

      @Override
      public void setUpdateSergeryAfterPetCard(PetSurgeryAfter petSurgeryAfter) 
      {
          String SQL = "update PetSurgeryAfter set petSurgeryDateAfter =?, petSurgeryContentAfter=? where PetSurgeryAfterNum  =?";
          template.update(SQL, petSurgeryAfter.getPetSurgeryAfterDate(), petSurgeryAfter.getPetSurgeryAfterContent(), petSurgeryAfter.getPetSurgeryAfterNum());
      }

      @Override
      public List<Pet> petcardback(String petid) {
         String SQL = "select * from Pet where PetId=?";
         List<Pet> pet = template.query(SQL, new Object[] {petid}, new PetDBConnector());
         return pet;
      }

      @Override
      public List<PetWeight> petcardWheightback(String petid) {
         String SQL = "select * from PetWeight where PetId=?";
         List<PetWeight> listOfPetWeight  = template.query(SQL, new Object[] {petid}, new PetWeightDBConnector());
         return listOfPetWeight;
      }

      @Override
      public List<PetChart> petcardChartback(String petid) {
         String SQL = "select * from PetChart where PetId=?";
         List<PetChart> listOfPetChard   = template.query(SQL, new Object[] {petid}, new PetChartDBConnector());
         return listOfPetChard;
      }

      @Override
      public List<PetVaccination> petcardVaccinationback(String petid) {
         String SQL = "select * from petVaccination where PetId=?";
         List<PetVaccination> listOfpetVaccination = template.query(SQL, new Object[] {petid}, new PetVaccinationDBConnector());
         return listOfpetVaccination;
      }

      @Override
      public List<PetSurgery> petcardSurgeryback(String petid) {
         String SQL = "select * from PetSurgery where PetId=?";
         List<PetSurgery> listOfPetSurgery = template.query(SQL, new Object[] {petid}, new PetSurgeryDBConnector());
         return listOfPetSurgery;
      }

      @Override
      public List<PetSurgeryAfter> petcardSurgeryAfterback(String petid) {
         String SQL = "select * from petVaccination where PetId=?";
         List<PetSurgeryAfter> listOfPetSurgeryAfter  = template.query(SQL, new Object[] {petid}, new PetSurgeryAfterDBConnector());
         return listOfPetSurgeryAfter;
      }
      
}

















