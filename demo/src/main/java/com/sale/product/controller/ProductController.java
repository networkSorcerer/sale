package com.sale.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sale.product.service.ProductService;
import com.sale.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/product/*")
@Slf4j
public class ProductController {
	@Setter(onMethod_=@Autowired)
	private ProductService productservice;
	
	@GetMapping("/productList")
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		List<ProductVO>productList =productservice.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "sale/product/productView";
		
	}
}