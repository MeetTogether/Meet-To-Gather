package com.meetogether.eeit10908.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.model.Member;

@Entity
@Table(name="eventListJoin")
public class ActJoinBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer Joinid;
	

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "eventId")
	private ActBean eventBean;
	
	

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "memberId")
	private MemberBean memberbean;
	
	
	
	
	public ActJoinBean() {
		
	}


	public Integer getJoinid() {
		return Joinid;
	}




	public void setJoinid(Integer joinid) {
		Joinid = joinid;
	}

	public ActBean getEventBean() {
		return eventBean;
	}




	public void setEventBean(ActBean eventBean) {
		this.eventBean = eventBean;
	}




	public MemberBean getMemberbean() {
		return memberbean;
	}




	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}
	


	

}