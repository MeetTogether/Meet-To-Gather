package com.meetogether.eeit10927.dao;

import java.util.List;

import com.meetogether.eeit10927.model.Msglike;

public interface IMsglikeDao {

	void addMsglike(Msglike mlike);

	List<Msglike> getAllMsgLike(Msglike mlike);

	void deleteMsglike(Msglike mlike);
	
	List<Msglike> findMsglikeByMember(Integer memberId);
	
	String findMsglikeByMsgAndMember(Msglike mlike);
	
	List<Msglike> findMsglikeByMessage(Integer messageId);

}