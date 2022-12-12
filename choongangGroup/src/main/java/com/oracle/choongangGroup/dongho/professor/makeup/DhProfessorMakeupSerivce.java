package com.oracle.choongangGroup.dongho.professor.makeup;

import java.util.List;

import com.oracle.choongangGroup.hs.lecManagement.LectureVO;

public interface DhProfessorMakeupSerivce {

	List<LectureVO> findByProfAndStatus(String profName, String lecStatus);

	List<OrdersDto> findByLecId(Long id);

	OrdersDto findByLec_orders_id(Long lecOrdersId);

	int updateOrders(OrdersDto ordersDto);


}
