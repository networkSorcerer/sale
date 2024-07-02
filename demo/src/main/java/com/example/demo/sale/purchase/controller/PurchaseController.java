package com.example.demo.sale.purchase.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.sale.product.controller.ProductController;
import com.example.demo.sale.product.service.ProductService;
import com.example.demo.sale.product.vo.ProductVO;
import com.example.demo.sale.purchase.service.PurchaseService;
import com.example.demo.sale.purchase.vo.PurchaseVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/purchase/*")
@Slf4j
public class PurchaseController {
	@Setter(onMethod_=@Autowired)
	PurchaseService purchaseService;
	
	
	@RequestMapping("/purchaseList")
	public String getPurchaseList(Model model, @RequestParam Map<String, Object> paramMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception  {
	
//	
//		 int cpage = Integer.valueOf((String) paramMap.get("currentpage"));
//		 int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
//		 
//		 int startSeq = (cpage -1) * pageSize;
//		 
//		 paramMap.put("startSeq", startSeq);
//		 paramMap.put("pageSize", pageSize);
		 
		 List<PurchaseVO> purchaseList = purchaseService.purchaseList(paramMap);
		// int purchaseCnt = purchaseService.purchaseCnt(paramMap);
		 
		 
		 model.addAttribute("purchaseList", purchaseList);
		 //model.addAttribute("purchaseCnt",purchaseCnt);
		 
		 return "sale/purchase/purchaseList";
	}
}
