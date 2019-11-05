package com.meetogether.eeit10936.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class MemberInterestPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column(name = "memberid")
	private Integer memberId;
	@Column(name = "interestid")
	private Integer interestId;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getInterestId() {
		return interestId;
	}

	public void setInterestId(Integer interestId) {
		this.interestId = interestId;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof MemberInterestPK))
			return false;
		MemberInterestPK that = (MemberInterestPK) o;
		return Objects.equals(getMemberId(), that.getMemberId())
				&& Objects.equals(getInterestId(), that.getInterestId());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getMemberId(), getInterestId());
	}

}
