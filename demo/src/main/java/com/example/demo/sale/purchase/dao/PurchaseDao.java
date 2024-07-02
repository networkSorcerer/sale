package com.example.demo.sale.purchase.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.sale.purchase.vo.PurchaseVO;
@Mapper
public interface PurchaseDao {

	List<PurchaseVO> purchaseList(Map<String, Object> paramMap) throws Exception;

	int purchaseCnt(Map<String, Object> paramMap);

}
