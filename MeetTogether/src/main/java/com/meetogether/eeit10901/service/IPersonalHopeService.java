package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.pairs.model.MemberHope;


public interface IPersonalHopeService {
	  MemberBean getMemberById(Integer memberId) ;

	  void addPersonalHope(MemberHope mm);

	  List<MemberHope> getHopeList();

}
