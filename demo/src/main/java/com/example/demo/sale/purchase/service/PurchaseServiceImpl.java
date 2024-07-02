package com.example.demo.sale.purchase.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sale.purchase.dao.PurchaseDao;
import com.example.demo.sale.purchase.vo.PurchaseVO;

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
	public int purchaseCnt(Map<String, Object> paramMap) {
		return pdao.purchaseCnt(paramMap);
	}

}
