package com.example.demo.sale.product.vo;


// product , sale, sale customer, purchase, purchase customer 이렇게 5가지 화면 단을 만들자 
// 손인 화면 하나 더 추가 재고는 매입 매출 퉁쳐서 남은 재고 출력 될수 있게 하자 
//창고 테이블 도 만들어주면 좋을 듯 
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProductVO  {
	private int productId =0;
	private String productName="";
	private int productTypeId =0;
	private String productTypeName ="";
	private String  productIn = "";
	private int productKg =0;
	private String productLocation ="";
	private int productCount =0;
	private int cargoId=0;
	private String cargoName="";
	private int cargoPositionId=0;
	private int cargoPositionCapacity=0;
}
