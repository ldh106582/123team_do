package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalReview;
import com.springmvc.service.HospitalService;

@Repository
public class HospitalReviewRepositoryImp implements HospitalReviewRepository{

	private JdbcTemplate template;
	
	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	 }
	
	 @Autowired
	 HospitalService hospitalService;
	 
	@Override
	public List<HospitalReview> getAllReviews(String hid) {
		String SQL = "select * from HospitalReview where hid='"+hid+"'";
		List<HospitalReview> list = template.query(SQL, new HospitalReviewRowMapper());
		return list;
	}

	
	
	@Override
	public void addreview(HospitalReview review) {
		String SQL = "insert into HospitalReview values(?,?,?,?,?,?,?,?)";
		template.update(SQL,review.getHid(),review.getPersonId(),review.getTitle(),review.getContext(),review.getReviewScore(),review.getReviewImage(),getRegistDay(),CreatereviewId());
		
		
		Hospital hospital = hospitalService.gethosptialByhId(review.getHid());
		String hid = hospital.getHid();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from HospitalReview where hid='"+hid+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select coproductunt(*) from HospitalReview where hid='"+hid+"'";
		float count = template.queryForObject(SQL3, int.class);
//		업데이트
		String SQL4 = "update hospital set reviewScore=?,reviewCount=? where hid=?";
		template.update(SQL4,avg,count,hid);
	}
//	날짜받기
	public LocalDate getRegistDay()
	{
		return LocalDate.now();
	}
//	댓글Id 생성
	public String CreatereviewId() {
		String str = Long.toString(System.currentTimeMillis()) ;
		return str;
	}

	@Override
	public HospitalReview getReviewByID(String reviewid) {
		String SQL = "select * from HospitalReview";
		HospitalReview review = null;
		List<HospitalReview> list = template.query(SQL, new HospitalReviewRowMapper());
		for(int i =0;i<list.size();i++) {
			review=list.get(i);
			if(review.getReviewId().equals(reviewid)) {
				
				break;
			}
		}
		return review;
	}

	@Override
	public void updatereview(HospitalReview review,String reviewid) {
		HospitalReview Nreview = getReviewByID(reviewid);
		
		String SQL = "update HospitalReview set title=?,context=?,reviewScore=?,reviewImage=? where ReviewId='"+reviewid+"'";
		template.update(SQL,review.getTitle(),review.getContext(),review.getReviewScore(),review.getReviewImage());
		
		Hospital hospital = hospitalService.gethosptialByhId(Nreview.getHid());
		String hid = hospital.getHid();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from HospitalReview where hid='"+hid+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select count(*) from HospitalReview where hid='"+hid+"'";
		int count = template.queryForObject(SQL3, int.class);
		System.out.println(count);
//		업데이트
		String SQL4 = "update hospital set reviewScore=?,reviewCount=? where hid=?";
		template.update(SQL4,avg,count,hid);
	}

	@Override
	public void deletereview(String reviewId) {
		HospitalReview review = getReviewByID(reviewId);
		
		String SQL = "delete from HospitalReview where ReviewId='"+reviewId+"'";
		template.update(SQL);
		
		Hospital hospital = hospitalService.gethosptialByhId(review.getHid());
		String hid = hospital.getHid();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from HospitalReview where hid='"+hid+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select count(*) from HospitalReview where hid='"+hid+"'";
		int count = template.queryForObject(SQL3, int.class);
		System.out.println(count);
//		업데이트
		String SQL4 = "update hospital set reviewScore=?,reviewCount=? where hid=?";
		template.update(SQL4,avg,count,hid);
	}

	@Override
	public List<Hospital> get5scoreReview() {
		String SQL = "select * from hospital where reviewScore>=4.5 limit 3";
		return template.query(SQL, new HospitalRowMapper());
	}

	@Override
	public List<Hospital> get4scoreReview() {
		String SQL = "select * from hospital where reviewScore<4.5 and reviewScore>=4.0 limit 3";
		return template.query(SQL, new HospitalRowMapper());
	}

	@Override
	public List<Hospital> get3scoreReview() {
		String SQL = "select * from hospital where reviewScore>=3.0 and reviewScore<4.0 limit 3";
		return template.query(SQL, new HospitalRowMapper());
	}
}
