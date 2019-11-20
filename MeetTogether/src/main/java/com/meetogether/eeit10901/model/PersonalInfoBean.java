package com.meetogether.eeit10901.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "memberinfo")
public class PersonalInfoBean {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "memberid")
	private Integer memberId;
	@Column(name = "bodytype")
	private String bodyType;
	@Column(name = "marriage")
	private Integer marriage;
	@Column(name = "education")
	private String education;
	@Column(name = "smoking")
	private Integer smoking;
	@Column(name = "drink")
	private String drink;
	@Column(name = "ethnicity")
	private String ethnicity;
	@Column(name = "religion")
	private String religion;
	@Column(name = "salary")
	private String salary;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getBodyType() {
		return bodyType;
	}

	public void setBodyType(String bodyType) {
		this.bodyType = bodyType;
	}

	public Integer getMarriage() {
		return marriage;
	}

	public void setMarriage(Integer marriage) {
		this.marriage = marriage;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getSmoking() {
		return smoking;
	}

	public void setSmoking(Integer smoking) {
		this.smoking = smoking;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getEthnicity() {
		return ethnicity;
	}

	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public void setPersonalInfoBean(PersonalInfoBean mb) {
		// TODO Auto-generated method stub
		
	}

	public MemberBean getMemberBean() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setMemberBean(MemberBean mb) {
		// TODO Auto-generated method stub
		
	}
}
