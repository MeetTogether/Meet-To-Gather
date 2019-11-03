package com.meetogether.eeit10927.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meetogether.eeit10927.dao.IMsgTypeDao;
import com.meetogether.eeit10927.model.MsgType;
import com.meetogether.eeit10927.service.IMsgTypeService;

@Service
public class MsgTypeServiceImpl implements IMsgTypeService {
	
	IMsgTypeDao dao;
	
	@Autowired
	public void setDao(IMsgTypeDao dao) {
		this.dao = dao;
	}
	
	public MsgTypeServiceImpl() {
	}
	
	@Transactional
	@Override
	public List<MsgType> getMsgTypeList() {
		return dao.getMsgTypeList();
	}
	
	@Transactional
	@Override
	public MsgType getMsgTypeById(int msgTypeId) {
		return dao.getMsgTypeById(msgTypeId);
	}

	@Transactional
	@Override
	public MsgType getMsgTypeByName(String msgTypeName) {
		return dao.getMsgTypeByName(msgTypeName);
	}

}
