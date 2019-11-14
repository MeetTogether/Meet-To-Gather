package com.meetogether.eeit10913.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@Entity(name="eventCat")
@Table(name = "eventCat")
public class CatBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventCat;
	private String eventClass;
	@OneToMany(mappedBy = "catbean")
	private Set<ActBean> acts = new LinkedHashSet<>();
	public Set<ActBean> getActs() {
		return acts;
	}
	public void setActs(Set<ActBean> acts) {
		this.acts = acts;
	}
	public Integer getEventCat() {
		return eventCat;
	}
	public void setEventCat(Integer eventCat) {
		this.eventCat = eventCat;
	}
	public String getEventClass() {
		return eventClass;
	}
	public void setEventClass(String eventClass) {
		this.eventClass = eventClass;
	}

	
}
