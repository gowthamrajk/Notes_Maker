package com.spring.DomainClass;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="status")
public class Status implements Serializable{
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="statusName")
	private String statusName;
	
	Status(){
		
	}
	public Status(Integer id, String statusName) {
		this.id=id;
		this.statusName = statusName;
	}
	public Status(String statusName) {
		this.statusName = statusName;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
}
