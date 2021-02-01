package com.hcl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.hcl.dao.ProductRepo;
import com.hcl.model.Product;
import com.hcl.service.ProductServiceImpl;

@SpringBootApplication
public class MyMusicStore {

	@Autowired
	private ProductRepo repo;
	public static void main(String[] args) {
		SpringApplication.run(MyMusicStore.class, args);
	}

}
