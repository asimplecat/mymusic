package com.hcl.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hcl.model.Product;

@Repository
public interface ProductRepo extends CrudRepository<Product , Integer>{

}
