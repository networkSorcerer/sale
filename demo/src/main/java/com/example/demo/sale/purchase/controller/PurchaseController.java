package com.example.demo.sale.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.sale.product.controller.ProductController;
import com.example.demo.sale.product.service.ProductService;
import com.example.demo.sale.product.vo.ProductVO;
import com.example.demo.sale.purchase.service.PurchaseService;
import com.example.demo.sale.purchase.vo.PurchaseVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/purchase/*")
@Slf4j
public class PurchaseController {
    
    @Setter(onMethod_ = @Autowired)
    PurchaseService purchaseService;

    @RequestMapping("/purchase")
    public String init(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {
        String loginID = (String) session.getAttribute("loginId");
        paramMap.put("loginID", loginID);
        return "sale/purchase/purchase";
    }

    @RequestMapping("/purchaseList")
    public String getPurchaseList(Model model, @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "10") int pageSize, @RequestParam Map<String, Object> paramMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        int startSeq = (currentPage - 1) * pageSize;
        paramMap.put("startSeq", startSeq);
        paramMap.put("pageSize", pageSize);
        List<PurchaseVO> purchaseList = purchaseService.purchaseList(paramMap);
        int purchaseCnt = purchaseService.purchaseCnt(paramMap);
        model.addAttribute("purchaseList", purchaseList);
        model.addAttribute("purchaseCnt", purchaseCnt);
        return "sale/purchase/purchaseList";
    }

    @RequestMapping("/purchaseDetail")
    @ResponseBody
    public Map<String, Object> purchaseDetail(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        PurchaseVO detail = purchaseService.purchaseDetail(paramMap);
        resultMap.put("detailValue", detail);
        return resultMap;
    }

    @RequestMapping("/purchaseSave")
    @ResponseBody
    public Map<String, Object> purchaseSave(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        int result = purchaseService.purchaseSave(paramMap);
        String returnMsg = result > 0 ? "SUCCESS" : "fail";
        resultMap.put("result", returnMsg);
        return resultMap;
    }

    @RequestMapping("/purchaseUpdate")
    @ResponseBody
    public Map<String, Object> purchaseUpdate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        int result = purchaseService.purchaseUpdate(paramMap);
        String returnMsg = result > 0 ? "SUCCESS" : "fail";
        resultMap.put("result", returnMsg);
        return resultMap;
    }

    @RequestMapping("/deletePurchase")
    @ResponseBody
    public Map<String, Object> deletePurchase(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
            HttpServletResponse response, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        int result = purchaseService.deletePurchase(paramMap);
        String returnMsg = result > 0 ? "SUCCESS" : "fail";
        resultMap.put("result", returnMsg);
        return resultMap;
    }
}
