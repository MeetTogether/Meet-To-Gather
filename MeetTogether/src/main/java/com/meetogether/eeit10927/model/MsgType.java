package com.meetogether.eeit10927.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "msgtype")
public class MsgType implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer typeId;
	private String typeName;
//	private Set<Message> message = new LinkedHashSet<>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
//	@OneToMany(mappedBy="message")
//	public Set<Message> getMessage() {
//		return message;
//	}
//	public void setMessage(Set<Message> message) {
//		this.message = message;
//	}
	
}
