package com.oracle.choongangGroup.hs.lecManagement;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class LecManagementServiceImpl implements LecManagementService {
	
	private final LecManagementDao lmd;
	private final MakeupMapper mm;
	
	@Override
	public List<LectureVO> listLec(LectureVO lectureVO) {
		log.info("listLec start...");
		List<LectureVO> lecList = null;
		lecList = lmd.listLec(lectureVO);
		return lecList;
	}

	@Override
	public int lecAgreeCnt() {
		log.info("lecAgreeCnt start...");
		int lecAgreeTotal = lmd.lecAgreeCnt();
		return lecAgreeTotal;
	}

	@Override
	public LectureVO lecDetail(Long lec_id) {
		log.info("lecDetail start...");
		LectureVO lectureVO = lmd.lecDetail(lec_id);
		return lectureVO;
	}

	@Override
	public int lecTot(LectureVO lectureVO) {
		log.info("lecAgreeCnt start...");
		int lecTotal = lmd.lecTot(lectureVO);
		return lecTotal;
	}

	@Override
	public int lecDelete(Long lec_id) {
		log.info("lecDelte start...");
		int result = lmd.lecDelete(lec_id);
		return result;
	}

	@Override
	public int lecAgree(LectureVO lectureVO) {
		log.info("lecAgree start...");
		int result = lmd.lecAgree(lectureVO);
		return result;
	}

	@SuppressWarnings("unused")
	@Override
	public int insertOrders(LectureVO lectureVO) {
		int result = 0;
		Long lec_id = lectureVO.getLec_id();
		String lec_start = lectureVO.getLec_start();
		String day1 = lectureVO.getLec_day1();
		String day2 = lectureVO.getLec_day2();
//		String day2 = null;
		Long lec_max_count = lectureVO.getLec_max_count();
		int dateListIndex = 0;
		String[] dateList = new String[0];
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate strToLocalDate = LocalDate.parse(lec_start, format);
		// day1, day2 데이터 존재하는 경우 날짜List 생성
		if (day2 != null) {
			log.info("====day2 is not null====");
			dateList = new String[30];
			LocalDate dateOfDay1OfWeek = LocalDate.now();
			LocalDate dateOfDay2OfWeek = LocalDate.now();
			for (int i = 0; i < lec_max_count; i++) {
				dateOfDay1OfWeek = getDateOfDayOfWeek(day1, strToLocalDate);
				dateOfDay2OfWeek = getDateOfDayOfWeek(day2, strToLocalDate);
				if(strToLocalDate.isBefore(dateOfDay1OfWeek)) {
					if(dateOfDay1OfWeek.isAfter(dateOfDay2OfWeek)) {
						dateOfDay1OfWeek = dateOfDay1OfWeek.minusDays(7);
						strToLocalDate = dateOfDay1OfWeek.plusDays(7);
						dateList[dateListIndex] = dateOfDay2OfWeek.toString();
						dateList[dateListIndex + 29] = dateOfDay1OfWeek.plusDays(7*15).toString();
						dateListIndex += 1;
					} else {
						dateList[dateListIndex] = dateOfDay1OfWeek.toString();
						dateList[dateListIndex + 1] = dateOfDay2OfWeek.toString();
						dateListIndex += 2;
						strToLocalDate = dateOfDay1OfWeek.plusDays(7);
					}
				} else if(strToLocalDate.isEqual(dateOfDay1OfWeek)) {
					dateList[dateListIndex] = dateOfDay1OfWeek.toString();
					dateList[dateListIndex + 1] = dateOfDay2OfWeek.toString();
					dateListIndex += 2;
					strToLocalDate = strToLocalDate.plusDays(7);
				}
			}
		// day2 가 null 인 경우 날짜List 생성
		} else {
			log.info("====day2 is null====");
			dateList = new String[15];
			LocalDate dateOfDay1OfWeek = LocalDate.now();
			for (int i = 0; i < lec_max_count; i++) {
				dateOfDay1OfWeek = getDateOfDayOfWeek(day1, strToLocalDate);
				dateList[dateListIndex] = dateOfDay1OfWeek.toString();
				dateListIndex += 1;
				strToLocalDate = dateOfDay1OfWeek.plusDays(7);
			}
		}
		log.info(Arrays.toString(dateList));
		// 만든 dateList lecOrdersdto 값 세팅 후 Insert
		List<InsertLecOrdersDto> insertLecOrdersDtoList = new ArrayList<InsertLecOrdersDto>();
		for (int i = 0; i < dateList.length; i++) {
			InsertLecOrdersDto insertLecOrdersDto = new InsertLecOrdersDto();
			insertLecOrdersDto.setLec_order((long) i+1);
			insertLecOrdersDto.setLec_id(lec_id);
			insertLecOrdersDto.setLec_date(dateList[i]);
			
			insertLecOrdersDtoList.add(insertLecOrdersDto);
		}
		System.out.println(insertLecOrdersDtoList.toString());
		
		int insertResult = mm.insertOrdersDate(insertLecOrdersDtoList);
		log.info(Integer.toString(insertResult));
		return 0;
	}
	
	private LocalDate getDateOfDayOfWeek(String day, LocalDate localDate) {
		LocalDate dateOfDayOfWeek = LocalDate.now();
		switch (day) {
		case "월":
			dateOfDayOfWeek = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
			break;
		case "화":
			dateOfDayOfWeek = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.TUESDAY));
			break;
		case "수":
			dateOfDayOfWeek = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.WEDNESDAY));
			break;
		case "목":
			dateOfDayOfWeek = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.THURSDAY));
			break;
		case "금":
			dateOfDayOfWeek = localDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.FRIDAY));
			break;
	
		default:
			break;
		}
		return dateOfDayOfWeek;
	}

	@Override
	public int lecUpdate(LectureVO lectureVO) {
		log.info("lecUpdate start...");
		int result = lmd.lecUpdate(lectureVO);
		return result;
	}
	
}
