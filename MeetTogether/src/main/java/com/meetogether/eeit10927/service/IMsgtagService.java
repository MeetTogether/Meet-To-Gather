package com.meetogether.eeit10927.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msgtag;

public interface IMsgtagService {

	void add(Msgtag tag);

	List<Msgtag> getMsgtagByMsgId(Integer msgId);

	List<Msgtag> getAllMsgtag();
	
	List<Message> getMsgByTagName(String tagName);
	
	void deleteMsgTagByMsgId(Integer msgId);
	
	List<Msgtag> getMsgtagByQuery(String query);

}