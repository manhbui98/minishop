package edu.fa.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.fa.model.Product;
import edu.fa.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/", "/getAllProducts" }, method = RequestMethod.GET)
	public String getProducts(Model model) {
		List listOfProducts = productService.getAllProducts();
		model.addAttribute("product", new Product());
		model.addAttribute("listOfProducts", listOfProducts);
		return "productDetails";
	}

	@RequestMapping(value = "/getProudct/{id}", method = RequestMethod.GET)
	public Product getProductById(@PathVariable int id) {
		return productService.getProduct(id);
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		if (file != null) {
			byte[] fileContent = null;
			try {
				InputStream inputStream = file.getInputStream();
				if (inputStream == null)
					System.out.println("File inputstream is null");
				fileContent = IOUtils.toByteArray(inputStream);
				//System.out.println(fileContent);
				product.setImage(fileContent);
				//
				String path = request.getSession().getServletContext().getRealPath("/") + "resources/upload/";
				FileUtils.forceMkdir(new File(path));
				File upload = new File(path + file.getOriginalFilename());
				file.transferTo(upload);
				String imagePath = request.getContextPath() + "/resources/upload/" + file.getOriginalFilename();
				product.setImagePath(imagePath);
				request.getSession().setAttribute("product", product);
				if (product.getId() == 0) {
					productService.addProduct(product);
				} else {
					productService.updateProduct(product);
				}
				IOUtils.closeQuietly(inputStream);
			} catch (IOException ex) {
				System.out.println("Error !");
			}
		}

		return "redirect:/getAllProducts";
	}
	
	@RequestMapping(value = "/updateProduct/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String updateProduct(@PathVariable("id") int id, Model model) {
		Product product = productService.getProduct(id);
		model.addAttribute("product", product);
		return "editProduct";
	}
	
	@RequestMapping(value = "deleteProduct/{id}")
	public String deleteProduct(@PathVariable("id") int id) {
		productService.deleteProduct(id);
		return "redirect:/getAllProducts";
	}

}
