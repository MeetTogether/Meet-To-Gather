package com.meetogether.eeit10927.service;

import java.util.List;

import com.meetogether.eeit10927.model.MsgType;

public interface IMsgTypeService {

	List<MsgType> getMsgTypeList();

	MsgType getMsgTypeById(int msgTypeId);
	
	MsgType getMsgTypeByName(String msgTypeName);

}