package com.spring.DomainClass;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.annotations.ForeignKey;
import org.springframework.beans.factory.annotation.Autowired;
@SuppressWarnings("serial")
@Entity
@Table(name = "user")
public class User implements Serializable{
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id; 
	@Column(name = "userName")
	  private String userName;
	@Column(name = "password")
	  private String password;
	@Column(name = "email")
	  private String email;
	@Column(name = "mobileNumber")
	  private String mobileNumber;
	
User(){
    	
    }
    public User(Integer id, String userName, String password,String email, String mobileNumber) {
	this.id = id;
	this.userName = userName;
	this.password = password;
	this.email=email;
	this.mobileNumber = mobileNumber;
	
}
    public User( String userName, String password,String email, String mobileNumber) {
    	this.userName = userName;
    	this.password = password;
    	this.email=email;
    	this.mobileNumber = mobileNumber;
    	
    }
    public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email=email;
}

public String getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(String mobileNumber) {
	this.mobileNumber = mobileNumber;
}

}
