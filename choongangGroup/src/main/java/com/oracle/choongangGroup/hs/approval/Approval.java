package com.oracle.choongangGroup.hs.approval;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Approval {
	private Long approval_no;
	private Long approval_sort_no;
	private String mid_approver;
	private String fin_approver;
	private String title;
	private String item_need;
	private String item_quantity;
	private String approval_content;
	private String item_price;
	private String server_file_name;
	private String org_file_name;
	private String file_path;
	private String mid_approval_ok;
	private String fin_approval_ok;
	private String approval_status;
	private String approval_start;
	private String approval_end;
	private String mid_approval_opinion;
	private String fin_approval_opinion;
	private String userid;
	private String writeday;
	
	// 조회용
	private String search; 	private String keyword;
	private String name;
	private Member member;
	private Member midapprvo;
	private Member finapprvo;
	private ApprovalSort sort;
	private String approval_sort_name;
	
	// 페이징
	private int currentPage = 1;
	private int rowPage = 10;
	private int pageBlock= 10;
	private String pageNum;
	private int start;
	private int end;
	private int startPage;			
	private int endPage;
	private int total;				
	private int totalPage;
	
//	public Approval(int total, String currentPage1) {
//		this.total = total;	// 140
//		if (currentPage1 != null) {
//			this.currentPage = Integer.parseInt(currentPage1); // 2
//		}
//		//			1				10
//		start = (currentPage - 1) * rowPage + 1; // 시작시1	11
//		end	  = start + rowPage - 1;			 // 시작시10	20
//		//									25		/	10
//		totalPage = (int) Math.ceil((double)total / rowPage);	// 시작시 3 5 14
//					//		2			2
//		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작시 1
//		endPage = startPage + pageBlock - 1; // 10
//		//	10		14
//		if(endPage > totalPage) {
//			endPage = totalPage;
//		}
//	}
	
}
