package com.spring.DomainClass;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.DomainClass.*;
@SuppressWarnings("serial")
@Entity
@Table(name="notebook")
public class NoteBook implements Serializable{
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
      private Integer id;
	@Column(name = "noteBookName")
      private String noteBookName;
	@ManyToOne
	@ForeignKey(name="user")
	@Autowired
	  private User user;
public NoteBook(){
	
}
public NoteBook(String noteBookName,User user)
{
	this.noteBookName=noteBookName;
	this.user=user;
}
 public NoteBook(Integer id, String noteBookName,User user) {
	this.id = id;
	this.noteBookName = noteBookName;
	this.user=user;
}

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getNoteBookName() {
	return noteBookName;
}
public void setNoteBookName(String noteBookName) {
	this.noteBookName = noteBookName;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user=user;
}
}
