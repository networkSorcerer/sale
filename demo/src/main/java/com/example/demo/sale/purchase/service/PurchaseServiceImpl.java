package com.example.demo.sale.purchase.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sale.purchase.dao.PurchaseDao;
import com.example.demo.sale.purchase.vo.PurchaseVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Setter(onMethod_=@Autowired)
	PurchaseDao pdao;
	
	@Override
	public List<PurchaseVO> purchaseList(Map<String, Object> paramMap)throws Exception {
		return pdao.purchaseList(paramMap);
	}

	@Override
	public int purchaseCnt(Map<String, Object> paramMap)throws Exception {
		return pdao.purchaseCnt(paramMap);
	}

	@Override
	public PurchaseVO purchaseDetail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return pdao.purchaseDetail(paramMap);
	}

	@Override
	public int purchaseSave(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return pdao.purchaseSave(paramMap);
	}

	@Override
	public int purchaseUpdate(Map<String, Object> paramMap) throws Exception {
		return pdao.purchaseUpdate(paramMap);
	}

	@Override
	public int deletePurchase(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return pdao.deletePurchase(paramMap);
	}

	@Override
	public int purchaseSaveFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		return pdao.purchaseCnt(paramMap);
	}

}
