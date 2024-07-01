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
		typeList = pDAO.type(pvo);
		return typeList;
	}

	@Override
	public int updateProduct(ProductVO pvo){
		int result =0;
		result = pDAO.updateProduct(pvo);
		return result;
	}

	@Override
	public int productDelete(ProductVO pvo){
		int result = 0;
		result = pDAO.productDelete(pvo);
		return result;
	}

	@Override
	public List<ProductVO> cargo(ProductVO pvo) {
		List<ProductVO> cargoList = null;
		cargoList = pDAO.cargo(pvo);
		return cargoList;
	}

	@Override
	public List<ProductVO> position(ProductVO pvo) {
		List<ProductVO> cargoPosition = null;
		cargoPosition = pDAO.position(pvo);
		return cargoPosition;
	}

	@Override
	public int Create(ProductVO pvo) {
		int result =0;
		result =pDAO.Create(pvo);
		return result;
		
	}






	

	

}
