package com.example.demo.sale.product.service;

import java.util.List;

import com.example.demo.sale.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);

	public ProductVO productDetail(ProductVO pvo);

	public List<ProductVO> type(ProductVO pvo);

	public int updateProduct(ProductVO pvo);

	public int productDelete(ProductVO pvo);

	public List<ProductVO> cargo(ProductVO pvo);

	public List<ProductVO> position(ProductVO pvo);

	public int Create(ProductVO pvo);
	
}
