package com.meetogether.eeit10927.dao.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IVipStatusDao;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Repository
public class VipStatusDaoHibernateImpl implements IVipStatusDao {

	private SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	private IMessageDao msgDao;
	@Autowired
	public void setMsgDao(IMessageDao msgDao) {
		this.msgDao = msgDao;
	}
	
	@Override
	public void add(VipStatus vip) {
		MemberBean member = msgDao.getMemberById(vip.getMbId());

		Calendar cal = Calendar.getInstance();
		Date now = new Date();
		Timestamp startTime = new Timestamp(now.getTime());
		Timestamp endTime = new Timestamp(now.getTime());
		
		Session session = factory.getCurrentSession();
		String hql = "from VipStatus where memberId = ?0 and endTime >= ?1";
		VipStatus result = (VipStatus) session.createQuery(hql)
				.setParameter(0, vip.getMbId())
				.setParameter(1, endTime)
				.uniqueResult();
		
		if (result != null) {
			vip.setStartTime(vip.getStartTime());
			endTime = result.getEndTime();
			cal.setTime(endTime);
			cal.add(Calendar.DATE, 30);
			endTime.setTime(cal.getTime().getTime());
			vip.setEndTime(endTime);
			vip.setMember(member);
		} else {
			startTime = new Timestamp(new Date().getTime());
			cal.setTime(startTime);
			cal.add(Calendar.DATE, 30);
			endTime.setTime(cal.getTime().getTime());
			vip.setStartTime(startTime);
			vip.setVipStatus(1);
			vip.setExpired(0);
			vip.setEndTime(endTime);
			vip.setMember(member);
			session.save(vip);
		}
		System.out.println("********startTime: " + startTime + ", endTime: " + endTime);
		
	}
	
}
