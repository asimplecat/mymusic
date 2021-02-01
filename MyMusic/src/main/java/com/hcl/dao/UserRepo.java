package com.hcl.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hcl.model.Product;
import com.hcl.model.User;

@Repository
public interface UserRepo extends CrudRepository<User , Integer>{

}
