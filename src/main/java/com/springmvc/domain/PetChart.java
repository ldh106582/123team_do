package com.springmvc.domain;

import java.io.Serializable;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class PetChart implements Serializable{
	
	private int petChartNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate petChartDate;
	private String petChart;
	private String petChartContent;
	private String petId;
	
	public PetChart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getPetChartNum() {
		return petChartNum;
	}

	public void setPetChartNum(int petChartNum) {
		this.petChartNum = petChartNum;
	}



	public LocalDate getPetChartDate() {
	    return petChartDate;
	}

	public void setPetChartDate(LocalDate petChartDate) {
	    this.petChartDate = petChartDate;
	}
	
	public String getPetChart() {
		return petChart;
	}
	public void setPetChart(String petChart) {
		this.petChart = petChart;
	}
	public String getPetChartContent() {
		return petChartContent;
	}
	public void setPetChartContent(String petChartContent) {
		this.petChartContent = petChartContent;
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}
	
	
	
    
}
