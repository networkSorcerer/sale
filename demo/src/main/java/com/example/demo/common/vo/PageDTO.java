package com.example.demo.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
    private int startPage; 		
    private int endPage;  		
    private boolean prev, next; 

    private int total;			// 전체 레코드 수
    private CommonVO cvo;		// 페이지 번호(기본값: 1)와 한페이지에 보여줄 레코드 수(기본값: 10)

    public PageDTO(CommonVO cvo, int total) { 
        this.cvo = cvo;
        this.total = total;

        this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10;
        this.startPage = this.endPage - 9;

        int realEnd = (int) (Math.ceil((total * 1.0) / cvo.getAmount()));       
        if (realEnd <= this.endPage) {
          this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;

      }

}
