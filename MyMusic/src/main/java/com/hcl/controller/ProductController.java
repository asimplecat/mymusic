package com.hcl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.cfg.ContextAttributes.Impl;
import com.hcl.model.Product;
import com.hcl.model.User;
import com.hcl.service.ProductServiceImpl;

@RestController
public class ProductController {
	@Autowired
	private ProductServiceImpl service;
	
	List<Product> shoppingCart = new ArrayList<>();
	
	@GetMapping("/home")
	public ModelAndView getAllProducts() {
		
		List<Product> allProducts = service.getAllProducts();
		
		return new ModelAndView("home","allProducts",allProducts);
	}
	
	@GetMapping("/addProduct")
	public ModelAndView addProduct(HttpSession sesh) {
		if (sesh.getAttribute("sesname") != null || sesh.getAttribute("role").equals("admin"))
		{
			return new ModelAndView("addproduct");
		}
		List<Product> allProducts = service.getAllProducts();
		
		return new ModelAndView("home","allProducts",allProducts);
	}
	
	@PostMapping("/addProduct")
	public ModelAndView addProductSubmit(
			@RequestParam("title") String title,
			@RequestParam("album") String album,
			@RequestParam("artist") String artist,
			@RequestParam("genre") String genre,
			@RequestParam("price") String price,
			@RequestParam("img") String img,
			HttpSession sesh) {
		
		User u = (User) sesh.getAttribute("sesname");
		
		
		if (u != null && u.getRole().equals("admin"))
		{
			Product p = new Product();
			p.setAlbum(album);
			p.setArtist(artist);
			p.setGenre(genre);
			p.setImg(img);
			p.setTitle(title);
			p.setPrice(Integer.parseInt(price));
			
		
			service.save(p);
			
			System.out.println("completed");
			
			return new ModelAndView("addproduct");
		}
		
		return new ModelAndView("home","allProducts", service.getAllProducts());
	}
	
	@GetMapping("/viewProduct/{id}")
	public ModelAndView viewProduct(@PathVariable("id") int id)
	{
		Product p = service.findById(id);
		return new ModelAndView("viewProduct","product",p);
	}
	
	@GetMapping("/shoppingcart")
	public ModelAndView viewShoppingCart() {
		
		return new ModelAndView("shoppingcart" , "cart",shoppingCart );
	}
	
	@GetMapping("/editProducts")
	public ModelAndView editProd(HttpSession sesh) {
		return new ModelAndView("editProducts", "allProducts" ,service.getAllProducts());
	}
	
	@GetMapping("/editProduct/{id}")
	public ModelAndView editProd2(@PathVariable("id") int id) {
		return new ModelAndView("editProduct" , "prod" , service.findById(id));
	}
	
	@PostMapping("/editProduct")
	public String editProd3(@RequestParam("title") String title,
			@RequestParam("album") String album,
			@RequestParam("artist") String artist) {
		Product p = service.findByTitle(title);
		p.setTitle(title);
		p.setArtist(artist);
		p.setAlbum(album);
		service.save(p);
		
		return "redirect:editProducts";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id)
	{
		service.delete(id);
		return "redirect:editProducts";
	}
	
	@PostMapping("/search") 
	public ModelAndView searchFor(@RequestParam("search") String search) {
		List<Product> p = new ArrayList<>();
		
		p.addAll(service.getAllByArtist(search));
		p.addAll(service.getAllByTitle(search));
		p.addAll(service.getAllByArtist(search));
		
		return new ModelAndView("search","results", p);
	}
	
	@GetMapping("/addtocart/{id}")
	public ModelAndView addToCart(@PathVariable("id") int id)
	{
		shoppingCart.add(service.findById(id));
		return new ModelAndView("redirect:/home","allProducts",service.getAllProducts());
	}
	
	@GetMapping("/checkout")
	public ModelAndView checkout(HttpSession sesh)
	{
		if (sesh.getAttribute("sesname")!= null)
		{
			return new ModelAndView("checkout","cart",shoppingCart);
		}
		List<Product> allProducts = service.getAllProducts();
		
		return new ModelAndView("home","allProducts",allProducts);
	}
	
	
}
