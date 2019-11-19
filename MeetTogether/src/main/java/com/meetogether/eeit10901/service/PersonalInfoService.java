package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
;

public interface PersonalInfoService {

	  List<MemberInfo>  addPersonalInfo(MemberInfo personalinfo); 
	  List<MemberInfo> getAllInfo();
	  MemberBean getMemberById(Integer memberId) ;
}
