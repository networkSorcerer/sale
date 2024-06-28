package com.example.demo.sale.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sale.product.dao.ProductDAO;
import com.example.demo.sale.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Setter(onMethod_=@Autowired)
	private ProductDAO pDAO;
	
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List <ProductVO> list = null;
		list = pDAO.productList(pvo);
		return list;
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = pDAO.productDetail(pvo);
		
		return detail;
	}

	@Override
	public List<ProductVO> type(ProductVO pvo) {
		List <ProductVO> typeList = null;
		typeList = pDAO.productList(pvo);
		return typeList;
	}

}
