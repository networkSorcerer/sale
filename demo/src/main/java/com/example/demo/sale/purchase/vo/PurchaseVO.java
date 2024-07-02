package com.example.demo.sale.purchase.vo;


import java.sql.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PurchaseVO {
	private int purchase_id=0;
	private Date purchase_date;
	private int product_kg=0;
	private int purchase_count=0;
	private int product_id=0;
	private int product_type_id=0;
	private String product_type_name="";
	private String product_name="";
}
