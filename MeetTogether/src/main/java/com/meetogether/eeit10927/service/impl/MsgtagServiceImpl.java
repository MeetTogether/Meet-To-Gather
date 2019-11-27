package com.meetogether.eeit10927.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10927.dao.IMsgtagDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msgtag;
import com.meetogether.eeit10927.service.IMsgtagService;

@Service
public class MsgtagServiceImpl implements IMsgtagService {
	
	IMsgtagDao tagDao;
	@Autowired
	public void setTagDao(IMsgtagDao tagDao) {
		this.tagDao = tagDao;
	}

	@Transactional
	@Override
	public void add(Msgtag tag) {
		tagDao.add(tag);
	}

	@Transactional
	@Override
	public List<Msgtag> getMsgtagByMsgId(Integer msgId) {
		return tagDao.getMsgtagByMsgId(msgId);
	}

	@Transactional
	@Override
	public List<Msgtag> getAllMsgtag() {
		return tagDao.getAllMsgtag();
	}

	@Transactional
	@Override
	public List<Message> getMsgByTagName(String tagName) {
		return tagDao.getMsgByTagName(tagName);
	}

	@Transactional
	@Override
	public void deleteMsgTagByMsgId(Integer msgId) {
		tagDao.deleteMsgTagByMsgId(msgId);
	}

	@Transactional
	@Override
	public List<Msgtag> getMsgtagByQuery(String query) {
		return tagDao.getMsgtagByQuery(query);
	}

	@Transactional
	@Override
	public Map<String, Integer> getAllMsgtagByCnt() {
		return tagDao.getAllMsgtagByCnt();
	}

}
