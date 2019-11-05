package com.meetogether.eeit10936.model;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "memberinterest")
public class MemberInterest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	@AttributeOverrides({ @AttributeOverride(name = "memberId", column = @Column(name = "memberid")),
			@AttributeOverride(name = "interestId", column = @Column(name = "interestid")) })
	private MemberInterestPK memberInterestPK;

	public MemberInterestPK getMemberInterestPK() {
		return memberInterestPK;
	}

	public void setMemberInterestPK(MemberInterestPK memberInterestPK) {
		this.memberInterestPK = memberInterestPK;
	}

}
