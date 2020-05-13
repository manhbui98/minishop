package edu.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fa.dao.ProductDAO;
import edu.fa.model.Product;

@Service("productService")
public class ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Transactional
	public List getAllProducts() {
		return productDAO.getAllProducts();
	}
	
	@Transactional
	public Product getProduct(int id) {
		return productDAO.getProduct(id);
	}
	
	@Transactional
	public void addProduct(Product product) {
		productDAO.addProduct(product);
	}
	
	@Transactional
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}
	
	@Transactional
	public void deleteProduct(int id) {
		productDAO.deleteProduct(id);
	}
}
