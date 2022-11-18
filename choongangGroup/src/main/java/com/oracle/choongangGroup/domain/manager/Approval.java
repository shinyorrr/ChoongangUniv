package com.oracle.choongangGroup.domain.manager;

import javax.persistence.*;

import lombok.Data;

@Entity
@Data
public class Approval {
    
	@Enumerated(EnumType.STRING)
	private ApprovalForm approvalForm;
	
    @Id
    private int approval_no;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mem_userid")
    private Member member;

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
    
    @Enumerated(EnumType.STRING)
    private ApprovalStatus approvalStatus;
    
    private String approval_start;
    private String approval_end;
    private String mid_approval_opinion;
    private String fin_approval_opinion;


}
