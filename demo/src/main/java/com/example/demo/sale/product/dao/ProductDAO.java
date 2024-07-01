package com.example.demo.sale.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.sale.product.vo.ProductVO;

@Mapper
public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo);

	public ProductVO productDetail(ProductVO pvo);
	public List<ProductVO> type(ProductVO pvo);
	public int updateProduct(ProductVO pvo);
	public int productDelete(ProductVO pvo);
	public List<ProductVO> productInsert(ProductVO pvo);

	public List<ProductVO> cargo(ProductVO pvo);
	
	public List<ProductVO> position(ProductVO pvo);


}
