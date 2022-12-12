package com.oracle.choongangGroup.dongho.professor.makeup;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.dongho.professor.LectureMapper;
import com.oracle.choongangGroup.dongho.professor.mappers.OrdersMapper;
import com.oracle.choongangGroup.hs.lecManagement.LectureVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class DhProfessorMakeupServiceImpl implements DhProfessorMakeupSerivce {
	
	final private LectureMapper lectureMapper;
	final private OrdersMapper ordersMapper;
	@Override
	public List<LectureVO> findByProfAndStatus(String profName, String lecStatus) {
		return lectureMapper.findByProfAndStatus(profName, lecStatus);
	}
	@Override
	public List<OrdersDto> findByLecId(Long id) {
		List<OrdersDto> orderDtoList = ordersMapper.findByLecId(id);
		for (OrdersDto ordersDto : orderDtoList) {
			ordersDto.setLec_day(getDay(ordersDto.getLec_date()));
			transferStatus(ordersDto);
		}
		return orderDtoList;
	}
	
	@Override
	public OrdersDto findByLec_orders_id(Long lecOrdersId) {
		OrdersDto ordersDto = ordersMapper.findByLec_orders_id(lecOrdersId);
		transferStatus(ordersDto);
		return ordersDto;
	}
	
	@Override
	public int updateOrders(OrdersDto ordersDto) {
		return ordersMapper.updateOrders(ordersDto);
	}
	
	
	// 요일 구하는 method
	private String getDay(String date) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate strToLocalDate = LocalDate.parse(date, format);
		String lec_date = strToLocalDate.getDayOfWeek().getDisplayName(TextStyle.NARROW, Locale.KOREA);
		return lec_date;
	}
	
	// lec_order_status 숫자값 -> 상태설명값 변환 method
	private void transferStatus(OrdersDto ordersDto) {
		if(ordersDto.getLec_order_status() == null) {
			ordersDto.setLec_order_status("정상강의");
		} else {
			switch (ordersDto.getLec_order_status()) {
			case "-2":
				ordersDto.setLec_order_status("정상강의");
				break;
			case "-1":
				ordersDto.setLec_order_status("임시저장");
				break;
			case "0":
				ordersDto.setLec_order_status("승인대기");
				break;
			case "1":
				ordersDto.setLec_order_status("승인");
				break;
			case "2":
				ordersDto.setLec_order_status("승인거부");
				break;
			}
		}
	}

}
