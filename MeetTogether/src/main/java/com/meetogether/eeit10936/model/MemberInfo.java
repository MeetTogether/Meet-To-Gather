package com.meetogether.eeit10936.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "memberinfo")
public class MemberInfo implements Serializable {

	private static final long serialVersionUID = 1L;
//	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(value = "member", name = "property"))
	@Id
//	@GeneratedValue(generator = "generator")
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
//	@OneToOne(fetch = FetchType.LAZY)
//	@PrimaryKeyJoinColumn
//	private MemberBasic member;

//	public MemberBasic getMember() {
//		return member;
//	}
//
//	public void setMember(MemberBasic member) {
//		this.member = member;
//	}

	// private String PersonalityCharacteristic=null;
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

}