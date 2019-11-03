package com.meetogether.eeit10927.service;

import java.util.List;

import com.meetogether.eeit10927.model.Msglike;
import com.meetogether.eeit10927.model.Msgreply;

public interface IMsgreplyService {
	
	void addMsgreply(Msgreply re);
	
	List<Msgreply> getAllMsgreply(Integer msgId);
	
	void addMsglike(Msglike mlike);

	List<Msglike> getAllMsgLike(Msglike mlike);

	void deleteMsglike(Msglike mlike);
	
	List<Msglike> findMsglikeByMember(Integer memberId);
	
	String findMsglikeByMsgAndMember(Msglike mlike);
	
}
