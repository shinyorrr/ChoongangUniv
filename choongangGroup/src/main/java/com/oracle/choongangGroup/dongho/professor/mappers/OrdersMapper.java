package com.oracle.choongangGroup.dongho.professor.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.oracle.choongangGroup.dongho.professor.makeup.OrdersDto;

@Mapper
public interface OrdersMapper {
	
	@Select("SELECT   lo.lec_orders_id        lec_orders_id, "
				   + "lo.lec_id               lec_id, "
				   + "lo.lec_order_status     lec_order_status, "
			       + "lo.lec_date             lec_date, "
			       + "lo.lec_time             lec_time, "
			       + "lo.lec_order_date       lec_order_date, "
			       + "lo.lec_order_time       lec_order_time, "
			       + "lo.lec_order_building   lec_order_building, "
			       + "lo.lec_order_room       lec_order_room "
		  + "FROM     lec_orders lo, lecture l "
		  + "WHERE    lo.lec_id = #{lec_id} "
		  + "AND      lo.lec_id = l.lec_id "
		  + "ORDER BY lo.lec_order")
	List<OrdersDto> findByLecId(@Param("lec_id") Long id);
	
	@Select(  "SELECT * "
			+ "FROM   lec_orders "
			+ "WHERE  lec_orders_id = #{lecOrdersId}")
	OrdersDto findByLec_orders_id(@Param("lecOrdersId") Long lecOrdersId);
	
	@Update("  UPDATE lec_orders "
			+ "SET    lec_order_reason   = #{ordersDto.lec_order_reason}, "
			+ "	      lec_order_status   = #{ordersDto.lec_order_status}, "
			+ "	      lec_order_date     = #{ordersDto.lec_order_date}, "
			+ "	      lec_order_time     = #{ordersDto.lec_order_time}, "
			+ "	      lec_order_hour     = #{ordersDto.lec_order_hour}, "
			+ "	      lec_order_building = #{ordersDto.lec_order_building}, "
			+ "	      lec_order_room     = #{ordersDto.lec_order_room} "
			+ "WHERE  lec_orders_id      = #{ordersDto.lec_orders_id}"
			)
	int updateOrders(@Param("ordersDto") OrdersDto ordersDto);
	
}
