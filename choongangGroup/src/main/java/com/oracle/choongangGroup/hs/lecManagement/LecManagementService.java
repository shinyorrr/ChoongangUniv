package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

import com.oracle.choongangGroup.dongho.professor.makeup.OrdersDto;

public interface LecManagementService {

	List<LectureVO> listLec(LectureVO lectureVO);

	int lecAgreeCnt();

	LectureVO lecDetail(Long lec_id);

	int lecTot(LectureVO lectureVO);

	int lecDelete(Long lec_id);

	int lecAgree(LectureVO lectureVO);

	int insertOrders(LectureVO lectureVO);

	int lecUpdate(LectureVO lectureVO);

	int makeupTot();

	List<OrdersDto> lecOrderList(OrdersDto ordersDto);

	OrdersDto lecOrderdetail(Long lec_orders_id);

	int lecOrderUpdate(OrdersDto ordersDto);

}
