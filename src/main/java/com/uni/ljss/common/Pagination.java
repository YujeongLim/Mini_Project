package com.uni.ljss.common;


import com.uni.ljss.product.model.dto.PageInfo;
import com.uni.ljss.notice.model.dto.PageInfo1;



public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int limit) {
		
		// * maxPage : 총 페이지 수
		
		int maxPage = (int)Math.ceil((double)listCount/limit);




		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		

		PageInfo pi = new PageInfo( currentPage,listCount, startPage, endPage, maxPage, pageLimit, limit);


		


		return pi;
		
	}
	
public static PageInfo1 getPageInfo1(int listCount, int currentPage, int pageLimit, int limit) {
		
		// * maxPage : 총 페이지 수
		
		int maxPage = (int)Math.ceil((double)listCount/limit);




		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		

		PageInfo1 pi = new PageInfo1( currentPage,listCount, startPage, endPage, maxPage, pageLimit, limit);


		


		return pi;
		
	}
	
	

}
