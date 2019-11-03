package com.meetogether.eeit10927.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10927.dao.IMsglikeDao;
import com.meetogether.eeit10927.dao.IMsgreplyDao;
import com.meetogether.eeit10927.model.Msglike;
import com.meetogether.eeit10927.model.Msgreply;
import com.meetogether.eeit10927.service.IMsgreplyService;

@Service
public class MsgreplyServiceImpl implements IMsgreplyService {

	IMsgreplyDao mrDao;
	@Autowired
	public void setMrDao(IMsgreplyDao dao) {
		this.mrDao = dao;
	}
	
	IMsglikeDao mlDao;
	@Autowired
	public void setMlDao(IMsglikeDao mlDao) {
		this.mlDao = mlDao;
	}

	@Transactional
	@Override
	public void addMsgreply(Msgreply re) {
		mrDao.add(re);
	}

	@Transactional
	@Override
	public List<Msgreply> getAllMsgreply(Integer msgId) {
		return mrDao.getAllMsgreply(msgId);
	}

	@Transactional
	@Override
	public void addMsglike(Msglike mlike) {
		mlDao.addMsglike(mlike);
	}

	@Transactional
	@Override
	public List<Msglike> getAllMsgLike(Msglike mlike) {
		return mlDao.getAllMsgLike(mlike);
	}
	
	@Transactional
	@Override
	public void deleteMsglike(Msglike mlike) {
		mlDao.deleteMsglike(mlike);
	}

	@Transactional
	@Override
	public List<Msglike> findMsglikeByMember(Integer memberId) {
		return mlDao.findMsglikeByMember(memberId);
	}

	@Transactional
	@Override
	public String findMsglikeByMsgAndMember(Msglike mlike) {
		return mlDao.findMsglikeByMsgAndMember(mlike);
	}

}
