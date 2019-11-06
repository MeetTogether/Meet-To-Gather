package com.meetogether.eeit10936.pairs.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "pairlist")
public class Pair implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	@AttributeOverrides({ @AttributeOverride(name = "memberId", column = @Column(name = "memberid")),
			@AttributeOverride(name = "pairMemberId", column = @Column(name = "pairmemberid")) })
	private PairPK pairPk;
	
	@Column(name = "status")
	private Integer status;
	@Column(name = "pairtime", insertable = false, updatable = false)
	private Timestamp pairTime;

	
	

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getPairTime() {
		return pairTime;
	}

	public PairPK getPairPK() {
		return pairPk;
	}

	public void setPairPK(PairPK pairPk) {
		this.pairPk = pairPk;
	}

}
