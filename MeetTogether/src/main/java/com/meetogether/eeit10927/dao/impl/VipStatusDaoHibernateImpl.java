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
	public String add(VipStatus vip) {
		VipStatus vip2 = new VipStatus();
		MemberBean member = msgDao.getMemberById(vip.getMbId());

		Calendar cal = Calendar.getInstance();
		Date now = new Date();
		Timestamp startTime = new Timestamp(now.getTime());
		Timestamp endTime = new Timestamp(now.getTime());
		
		Session session = factory.getCurrentSession();
		String hql = "from VipStatus where memberId = ?0 and endTime >= ?1 and expired = 0";
		VipStatus result = (VipStatus) session.createQuery(hql)
				.setParameter(0, vip.getMbId())
				.setParameter(1, endTime)
				.uniqueResult();
		
		if (result != null) {
			Integer vipId = result.getVipId();
			result.setVipStatus(0);
			updateVipExpired(vipId);
			
			startTime = result.getStartTime();
			endTime = result.getEndTime();
			cal.setTime(endTime);
		} else {
			startTime = new Timestamp(new Date().getTime());
			cal.setTime(startTime);
		}
		
		cal.add(Calendar.DATE, 30);
		endTime.setTime(cal.getTime().getTime());
		vip2.setStartTime(startTime);
		vip2.setEndTime(endTime);
		vip2.setOrderNumber(String.valueOf(System.currentTimeMillis()));
		vip2.setExpired(0);
		vip2.setMember(member);
		session.save(vip2);
		
		return vip2.getOrderNumber();
		
	}
	
	public void updateVipExpired(Integer vipId) {
		String hql = "from VipStatus where vipId = ?0";
		VipStatus result = (VipStatus) factory.getCurrentSession().createQuery(hql).setParameter(0, vipId).uniqueResult();
		result.setExpired(1);
	}
	
	@Override
	public void vipUpgradeSuccess(String MerchantTradeNo) {
		System.out.println("---------" + MerchantTradeNo);
		String hql = "from VipStatus where orderNumber = ?0";
		VipStatus result = (VipStatus) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, MerchantTradeNo).uniqueResult();
		result.setVipStatus(1);
	}
	
}
