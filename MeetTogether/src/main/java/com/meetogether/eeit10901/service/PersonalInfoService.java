package com.meetogether.eeit10901.service;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
;

public interface PersonalInfoService {

	  void  addPersonalInfo(PersonalInfoBean personalinfo); 

	  MemberBean getMemberById(Integer memberId) ;
}
