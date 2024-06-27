package com.sale.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.product.dao.ProductDAO;
import com.sale.product.vo.ProductVO;

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

}
