package com.meetogether.eeit10927.dao;

import java.util.List;

import com.meetogether.eeit10927.model.MsgType;

public interface IMsgTypeDao {

	List<MsgType> getMsgTypeList();
	
	MsgType getMsgTypeById(int msgTypeId);
	
	MsgType getMsgTypeByName(String msgTypeName);

}