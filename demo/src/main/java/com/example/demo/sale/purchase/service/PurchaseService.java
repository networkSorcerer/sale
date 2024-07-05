package com.example.demo.sale.purchase.service;

import java.util.List;
import java.util.Map;

import com.example.demo.sale.purchase.vo.PurchaseVO;

public interface PurchaseService {

	List<PurchaseVO> purchaseList(Map<String, Object> paramMap) throws Exception;

	int purchaseCnt(Map<String, Object> paramMap);

	PurchaseVO purchaseDetail(Map<String, Object> paramMap);

}
