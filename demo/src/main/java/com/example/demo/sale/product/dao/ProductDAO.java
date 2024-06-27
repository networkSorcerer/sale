package com.example.demo.sale.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.sale.product.vo.ProductVO;

@Mapper
public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo);
}
