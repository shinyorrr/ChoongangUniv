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
	
	@Select("SELECT count(*) FROM lec_orders WHERE lec_order_status = 0")
	int makeupTot();
	
	@Select({"<script> "
			+ "SELECT o.*, l.lec_name as lecName " 
			+ "FROM lecture l, lec_orders o " 
			+ "WHERE l.lec_id = o.lec_id " 
			+ "AND lec_order_status in (0,1,2)"
			+ "<if test=\"status != null and status != ''\">"
			+ "AND lec_order_status Like '%' || #{status} || '%' "
			+ "</if>"
			+ "<if test=\"keyword != null and keyword != ''\">"
			+ "AND l.lec_name Like '%' || #{keyword} || '%'"
			+ "</if>"
			+ "ORDER BY o.lec_orders_id"
			+ "</script>"
			})
	List<OrdersDto> lecOrderList(OrdersDto ordersDto);
	
	@Select("SELECT o.*, l.lec_name as lecName " 
			+ "FROM  lecture l, lec_orders o " 
			+ "WHERE l.lec_id 	     = o.lec_id " 
			+ "AND   o.lec_orders_id = #{lec_orders_id}"
			+ "ORDER BY o.lec_orders_id"
			)
	OrdersDto lecDetail(Long lec_orders_id);
	
	@Update("UPDATE lec_orders " 
			+ "SET lec_order_status   = #{lec_order_status}," 
			+ "    lec_order_date     = #{lec_order_date}," 
			+ "    lec_order_time     = #{lec_order_time}," 
			+ "    lec_order_room     = #{lec_order_room}," 
			+ "    lec_order_building = #{lec_order_building}," 
			+ "    lec_order_hour     = #{lec_order_hour}" 
			+ "WHERE lec_orders_id    = #{lec_orders_id}"
			)
	int lecOrderUpdate(OrdersDto ordersDto);
	
}
