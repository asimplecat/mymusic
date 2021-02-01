package com.hcl.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	@Id @GeneratedValue
	private int Id;
	
	private String username;
	private String password;
	private String email;
	
	private String billingAddress;
	private String deliveryAddress;
	
	private String role;
}
