package com.sale.product.service;

import java.util.List;

import com.sale.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	
}
