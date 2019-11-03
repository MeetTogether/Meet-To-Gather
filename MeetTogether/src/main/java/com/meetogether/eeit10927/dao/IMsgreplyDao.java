package com.meetogether.eeit10927.dao;

import java.util.List;

import com.meetogether.eeit10927.model.Msgreply;

public interface IMsgreplyDao {
	
	public void add(Msgreply re);
	
	public List<Msgreply> getAllMsgreply(Integer msgId);
	
}
