package com.meetogether.eeit10901.dao;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.pairs.model.MemberHope;


public interface IPersonalHopeDao {
	

	  void addPersonalHope(MemberHope mm);

	  List<MemberHope> getMemberList();


	MemberBean getMemberById(Integer mm);
}
