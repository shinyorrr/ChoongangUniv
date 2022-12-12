package com.oracle.choongangGroup.dongho.professor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.choongangGroup.hs.lecManagement.LectureVO;

@Mapper
public interface LectureMapper {
	@Select("SELECT * FROM lecture WHERE prof_name = #{profname} AND lec_status = #{status}")
	List<LectureVO> findByProfAndStatus(@Param("profname") String profName, @Param("status") String lecStatus);
	
}
