package com.meetogether.eeit10901.service;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
;

public interface PersonalInfoService {

	  void  addPersonalInfo(MemberInfo personalinfo); 

	  MemberBean getMemberById(Integer memberId) ;
}
