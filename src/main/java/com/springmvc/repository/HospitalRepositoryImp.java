package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.net.ssl.HttpsURLConnection;
import javax.sql.DataSource;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springmvc.domain.AddressDTO;
import com.springmvc.domain.AnimalHopital;
import com.springmvc.domain.ENBoard;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalBooking;
import com.springmvc.domain.Person;

@Repository
public class HospitalRepositoryImp implements HospitalRepository{
	private JdbcTemplate template;

	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	 }
	 
	@Override
	public List<Hospital> getAllhospitals(int page) {
		int limit = 3;
		int start = (page - 1) * limit;
		int index = start + 2;
		
		if(page == 1) 
		{
			
			String SQL = "Select * from hospital limit 3";
			List<Hospital> list = template.query(SQL, new HospitalRowMapper());
			return list;		
		}
		else 
		{
			String SQL = "select * from hospital limit ? , ?";
			List<Hospital> list = template.query(SQL, new Object[] {start, index} ,new HospitalRowMapper());
			return list;	
		}
		
	}

	@Override
	public List<Hospital> getCount() {
		String SQL = "Select * from hospital";
		List<Hospital> listOfCount = template.query(SQL, new HospitalRowMapper());

		return listOfCount;
	}

	@Override
	public Hospital gethosptialByhId(String hid) {
		Hospital hospital=null;
		String SQL = "Select * from hospital";
		List<Hospital> list = template.query(SQL, new HospitalRowMapper());
		for(int i =0;i<list.size();i++) {
			hospital = list.get(i);
			if(hospital.getHid().equals(hid)) {
				break;
			}
		}
		return hospital;
	}
	
	String client_id = "peaxg064t9";
	 String client_secret ="8cU8yVtzZkXZkvHrHNryQCuOH3c1IWU626zy4pYi";
	 
	 
	@Override
	public void addhospital(Hospital hospital, String realpath) {
		String SQL = "insert into hospital values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String hid =getHid();
		String[] xy = getxy(hospital, realpath, hid);
		System.out.println("x값"+xy[0]+" y값"+xy[1]);
		String SQL2 = "select avg(reviewScore) from HospitalReview where hid='"+hid+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
		
		String SQL3 = "select count(*) from HospitalReview where hid='"+hid+"'";
		float count = template.queryForObject(SQL3, int.class);
		template.update(SQL,hospital.getName(),hospital.getAddr(),hospital.getNumber(),hospital.getRuntime(),hid,hospital.getParking(),hospital.getDescription(),hospital.getPersonId(),hospital.getImage(),xy[0],xy[1],avg,count);
		

	}

	public String[] getxy(Hospital hospital,String realpath,String hid) {
		String address = hospital.getAddr();
			String y = null;
	 	String x = null;
	 	try{
	 		 String addr = URLEncoder.encode(address,"UTF-8");
	 		 String reqUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
	 		
	 		 URL url = new URL(reqUrl);
			 HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			 con.setRequestMethod("GET");
			 con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", client_id);
			 con.setRequestProperty("X-NCP-APIGW-API-KEY", client_secret);
			
			 BufferedReader br;
			 int responseCode = con.getResponseCode();
			 if(responseCode==200) {
				 br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			 }else {
				 br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			 }
			 String line;
			 StringBuffer response = new StringBuffer();
			 while((line=br.readLine())!=null) {
				 response.append(line);
			 }
			 br.close();
			 JSONTokener tokener = new JSONTokener(response.toString());
			 JSONObject object = new JSONObject(tokener);
			 JSONArray arr = object.getJSONArray("addresses");
			 for(int i=0;i<arr.length();i++) {
   				 JSONObject temp =(JSONObject) arr.get(i);
   				 address =(String) temp.get("roadAddress");
				 x =(String) temp.get("x");
				 y =(String) temp.get("y");
			}
		 	System.out.println(x+y);
	 	}catch (Exception e){
	 	e.printStackTrace();
	 	}
	 	String[] s = new String[2];
	 	s[0] = x;
	 	s[1] = y;
	 	return s;
	}
	
	private String getHid() {
		String str = Long.toString(System.currentTimeMillis());
		return str;
	}

	@Override
	public void updateHospital(Hospital hospital, String hid,String realpath) {
		System.out.println(hospital.getAddr());
		String[] xy = getxy(hospital, realpath, hid);
		String SQL = "update hospital set name=?,number=?,runtime=?,parking=?,description=?,image=?,addr=?,filename=? where hid=?";
		template.update(SQL,hospital.getName(),hospital.getNumber(),hospital.getRuntime(),hospital.getParking(),hospital.getDescription(),hospital.getImage(),hospital.getAddr(),hid,xy[0],xy[1]);
	}

	@Override
	public void deleteHospital(String hid) {
		String SQL ="delete from hospital where hid='"+hid+"'";
		template.update(SQL);
		
	}

	@Override
	public List<Hospital> gethospitalsByTitle(String title) {
		try {
			String SQL = "select * from hospital where name Like '%"+title+"%'";
			List<Hospital> list = template.query(SQL, new HospitalRowMapper());
	        
	        if (list.isEmpty()) {
	            System.out.println("해당 제목은 없음");
	        }
	        return list;
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null; 
	    }

		
	}

	@Override
	public int myhospitalList(String personId) {
		String SQL = "select count(*) from hospital where personId='"+personId+"'";
		int num = template.queryForObject(SQL, Integer.class);
		return num;
	}

	@Override
	public List<HospitalBooking> todaybookList(String personId) {
		String SQL = "select * from HApllication where mid='"+personId+"'";
		List<HospitalBooking> list = template.query(SQL, new BookingRowMapper());
		if(list.isEmpty()) {
			return null;
		}
		List<HospitalBooking> newlist = new ArrayList<HospitalBooking>();
		HospitalBooking booking = null;
		String date = null;
		String today = LocalDate.now().toString();
		for(int i=0;i<list.size();i++) {
			booking=list.get(i);
			date = booking.getRegistDay();
			String[] splitdate = date.split(" ");
			if(splitdate[0].equals(today)) {
				newlist.add(booking);
			}
		}
		return newlist;
	}

	@Override
	public List<HospitalBooking> allbooklist(String personId) {
		String SQL = "select * from HApllication where mid='"+personId+"'";
		return template.query(SQL, new BookingRowMapper());
	}

	@Override
	public AddressDTO h_rest(String personId) {
		System.out.println("restAPI : " + personId);
		String SQL = "select * from person where personId=?";
		Person person = template.queryForObject(SQL, new Object[] {personId},new PersonDBConnector());
		String personAddr = person.getPersonAddress();
		System.out.println(personAddr);
		
		AddressDTO adress = new AddressDTO();
	
			
		try {
			String API_key = "21a8b551d1be7416798b5c64bbb1bc8a";
			String url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + URLEncoder.encode(personAddr, "UTF-8");
			
			URL s_url = new URL(url);
			HttpURLConnection con = (HttpURLConnection) s_url.openConnection();
			con.setRequestProperty("Authorization", "KakaoAK " + API_key);
			con.setRequestMethod("GET");
			
			BufferedReader br;
			int responseCode = con.getResponseCode();
			
			if(responseCode == 200)
			{
				br=new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			}
			else
			{
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String line;
			StringBuffer response = new StringBuffer();
			
			while((line=br.readLine())!=null) 
			{
				response.append(line);
			}
			
			br.close();
			System.out.println(response);
			
			JSONTokener tokener = new JSONTokener(response.toString());
			JSONObject obejct = new JSONObject(tokener);
			System.out.println("이 값을 알고 싶어 : " + obejct.toString());
			
			JSONArray arr = obejct.getJSONArray("documents");
			
			 System.out.println("왜없지 ? :" + arr);
			    if(arr.length() > 0) 
			    {
			        JSONObject temp = arr.getJSONObject(0);
			        double x = temp.getDouble("x");
			        double y = temp.getDouble("y");
			        System.out.println("x : " + x);
			        System.out.println("y : " + y);
			        adress.setX(x);
			        adress.setY(y);
			        System.out.println(adress.getX());
				 	return adress; 
			    }
			 
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return adress;
	}

	@Override
	public void publicAPI() {
	    System.out.println("ddds");
	    String key = "6SSihIOiLvtoN4Ov+cME/ZolzUd08COnp0X3j9Zu+Sor8dNfCM7u5Iyy/naB4Q5VsT27bE490/DOXsE/GUdjmQ==";
	    String result = "https://api.odcloud.kr/api/15044802/v1/uddi:46506e2c-4557-4e99-a4fd-939b1004d34c?page=10&perPage=10&returnType=json&serviceKey=";
	    System.out.println("ddds : " + result);

	    try {
		    String encodedKey = URLEncoder.encode(key, "UTF-8");
	        URL url = new URL(result + encodedKey);
	        
	        System.out.println("url : " + url);
	        HttpURLConnection con = (HttpURLConnection) url.openConnection();
	        System.out.println("con : " + con);
	        con.setRequestMethod("GET");
	        int responseCode = con.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br;
	        if(responseCode == 200) 
	        {
	        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	        }
	        else
	        {
	        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));	        	
	        }
	        StringBuilder response = new StringBuilder();
	        String line;
	        while ((line = br.readLine()) != null) {
	            response.append(line);
	        }
	        br.close();
	        System.out.println("result : " + result);
	        System.out.println("==================================");
	        JSONObject jsonObject = new JSONObject(response.toString());
	        System.out.println("jsonObject : " + jsonObject);
	        
	        JSONArray data = jsonObject.getJSONArray("data");
	        System.out.println("body : " + data);
	        
	     
	        for(int i = 0; i < data.length(); i++) {
	            JSONObject item = data.getJSONObject(i);
	            System.out.println("item : " + item);
	            String name = item.getString("소재지");
	            System.out.println("========================");
	            System.out.println("name: " + name);
	        }
	    }catch (Exception e) {
	    	
	    }
	       
	}

	@Override
	public List<Hospital> getMyhospitalList(String personId) {
		String SQL = "select * from hospital where personId='"+personId+"'";
		
		return template.query(SQL, new HospitalRowMapper());
	}
}