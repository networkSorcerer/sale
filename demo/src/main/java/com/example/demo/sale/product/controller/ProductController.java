package com.example.demo.sale.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.sale.product.service.ProductService;
import com.example.demo.sale.product.vo.ProductVO;

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
		System.out.println("Product List: " + productList);
		
		List<ProductVO>type = productservice.type(pvo);
		model.addAttribute("type", type);
		
		return "sale/product/productView";
		
	}
	
	@GetMapping("/adoptionDetail")
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {
		ProductVO detail= productservice.productDetail(pvo);
		model.addAttribute("detail", detail);
		
		return "sale/product/productList";
	}
	

//	@GetMapping(value = "/productList", produces = "application/json")
//	@ResponseBody
//	public Map<String ,Object> productList(@ModelAttribute ProductVO pvo, Model model) {
//		
//		Map<String , Object> resultMap = new HashMap<>();
//		List<ProductVO>productList =productservice.productList(pvo);
//		resultMap.put("productList",productList);
//		//model.addAttribute("productList", productList);
//		
//		return resultMap;
//		
//	}
}