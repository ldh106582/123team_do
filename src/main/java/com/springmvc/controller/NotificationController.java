package com.springmvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.HospitalBooking;
import com.springmvc.repository.NotificationRepository;

@Controller
@RequestMapping("header")
public class NotificationController {
	@Autowired
	NotificationRepository notification;
	
	@RequestMapping
	public String refheader(HttpSession session) {
		System.out.println("도착");
		String personId = (String) session.getAttribute("personId");
		
		HospitalBooking booking = notification.testhnotify(personId);
		if(booking != null) {
			session.setAttribute("hospitalalarm",  " 병원 예약 10분 전입니다");
			session.setAttribute("booking",  booking);
		}
		
		EApplication application = notification.testenotify(personId);
		if(application != null) {
			session.setAttribute("experiencealarm", " 체험단 예약 10분 전입니다");
			session.setAttribute("application", application);	 
		}
		
		return "module/header";
	}
}
