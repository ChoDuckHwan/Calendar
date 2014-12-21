package com.mycompany.myapp.domain;

public class UserRole {
	private Integer id;
	private String role;
	private String email;
	public UserRole() {
	}
	
	public UserRole(Integer id,String email, String role) {
		super();
		this.id = id;
		this.email = email;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return id;
	}

	public String getEmail() {
        return email;
    }
	
	public void setEmail(String email) {
        this.email = email;
    }
	
	public void setUserId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
