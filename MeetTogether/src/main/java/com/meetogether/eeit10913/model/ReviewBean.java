package com.meetogether.eeit10913.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "eventReview")
public class ReviewBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reviewId")

	Integer reviewId;
	Integer eventId;
	Integer memberId;
	String eventComment;
	Integer eventStars;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_MemberBean_memberId")
	private MemberBean memberBean;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_ActBean_eventId")
	private ActBean actBean;

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getEventComment() {
		return eventComment;
	}

	public void setEventComment(String eventComment) {
		this.eventComment = eventComment;
	}

	public Integer getEventStars() {
		return eventStars;
	}

	public void setEventStars(Integer eventStars) {
		this.eventStars = eventStars;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public ActBean getEventBean() {
		return actBean;
	}

	public void setEventBean(ActBean eventBean) {
		this.actBean = eventBean;
	}

	public ReviewBean(Integer reviewId, Integer eventId, Integer memberId, String eventComment, Integer eventStars,
			MemberBean memberBean, ActBean actBean) {
		super();
		this.reviewId = reviewId;
		this.eventId = eventId;
		this.memberId = memberId;
		this.eventComment = eventComment;
		this.eventStars = eventStars;
		this.memberBean = memberBean;
		this.actBean = actBean;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BookBean [reviewId=");
		builder.append(reviewId);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", eventComment=");
		builder.append(eventComment);
		builder.append(", eventStars=");
		builder.append(eventStars);
		builder.append(", memberBean=");
		builder.append(memberBean);
		builder.append("]");
		return builder.toString();
	}

}
