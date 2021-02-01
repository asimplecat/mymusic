package com.hcl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.UserRepo;
import com.hcl.model.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserRepo repo;
	
	@Override
	public User save(User user) {
		User u = repo.save(user);
		return u;
	}

	@Override
	public List<User> listAll() {
		
		return (List<User>) repo.findAll();
	}

	@Override
	public void delete(int id) {
		repo.deleteById(id);
	}

	@Override
	public User get(int id) {
		
		return repo.findById(id).get();
	}

	public User getByUsername(String username) {
		for (User u : repo.findAll())
		{
			System.out.println(username);
			System.out.println(repo.findAll());
			if (u.getUsername().equals(username))
			{
				return u;
			}
		}
		
		return null;
	}

}
