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
	private Long   item_quantity;
	private String approval_content;
	private String item_purpose;
	private String item_price;
	private String server_file_name;
	private String org_file_name;
	private String file_path;
	private String mid_approver_ok;
	private String fin_approver_ok;
	private String approval_status;
	private String writeday;
	private String approval_start;
	private String approval_end;
	private String mid_approver_opinion;
	private String fin_approver_opinion;
	private String userid;
	
	
	// 조회용
	private String search; 	private String keyword;
	private String mem_name;
	private MemDept memDept;
	private MemDept midapprvo;
	private MemDept finapprvo;
	private ApprovalSort sort;
	private String approval_sort_name;
	
	// 페이징
	private int start;
	private int end;
	
	
	@Override
	public String toString() {
		return "사번:" +userid+" / 첫번째 결재자:"+mid_approver+" / 두번째 결재자:"+fin_approver;
	}
	
}
