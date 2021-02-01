package com.hcl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.ProductRepo;
import com.hcl.model.Product;

@Service
public class ProductServiceImpl {
	@Autowired
	private ProductRepo repo;
	
	public List<Product> getAllProducts() {
		return (List<Product>) repo.findAll();
	}
	
	public Product findById(int id) {
		return repo.findById(id).get();
	}
	
	public Product save(Product p) {
		return repo.save(p);
	}
	
	public List<Product> getAllByGenre(String genre) {
		List<Product> list = new ArrayList<>();
		
		for (Product x : repo.findAll())
		{
			if (x.getGenre().equals(genre))
			{
				list.add(x);
			}
		}
		
		return list;
	}
	
	public List<Product> getAllByArtist(String artist) {
		List<Product> list = new ArrayList<>();
		
		for (Product x : repo.findAll())
		{
			if (x.getArtist().contains(artist))
			{
				list.add(x);
			}
		}
		
		return list;
	}
	
	public List<Product> getAllByTitle(String title) {
		List<Product> list = new ArrayList<>();
		
		for (Product x : repo.findAll())
		{
			if (x.getTitle().contains(title))
			{
				list.add(x);
			}
		}
		
		return list;
	}

	public void delete(int id)
	{
		repo.deleteById(id);
	}
	
	public Product findByTitle(String title) {
		for (Product x : repo.findAll())
		{
			if (x.getTitle().equals(title))
			{
				return x;
			}
		}
		return null;
	}
	

}
