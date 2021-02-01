package com.hcl.service;
import java.util.List;

import com.hcl.model.User;

public interface UserService {

	public User save(User user);

	public List<User> listAll();
	
	public void delete(int id);

	public User get(int id);

}