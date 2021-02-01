package com.hcl.service;
import java.util.List;

import com.hcl.model.Product;

public interface ProductService {

	public void save(Product prod);

	public List<Product> listAll();
	
	public void delete(Long id);

	public Product get(Long id);
	
	public List<Product> getAllInGenre(String genre);

}