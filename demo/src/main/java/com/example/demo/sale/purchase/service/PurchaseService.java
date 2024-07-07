package com.example.demo.sale.purchase.service;

import java.util.List;
import java.util.Map;

import com.example.demo.sale.purchase.vo.PurchaseVO;

public interface PurchaseService {

	public List<PurchaseVO> purchaseList(Map<String, Object> paramMap) throws Exception;

	public int purchaseCnt(Map<String, Object> paramMap) throws Exception;

	public PurchaseVO purchaseDetail(Map<String, Object> paramMap) throws Exception;

	public int purchaseSave(Map<String, Object> paramMap) throws Exception;

	public int purchaseUpdate(Map<String, Object> paramMap) throws Exception;

	public int deletePurchase(Map<String, Object> paramMap);

}
