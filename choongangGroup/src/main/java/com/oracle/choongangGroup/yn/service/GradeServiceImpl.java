package com.oracle.choongangGroup.yn.service;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.json.JSONArray;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.yn.repository.GradeRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class GradeServiceImpl implements GradeService {

	private final ObjectMapper obm;
	private final LecService ls;
	private final GradeRepository gr;
	
	public Object lecScoreExcel(HttpServletResponse response, Long id) {
		List<ApplicationLec> alList = ls.findByLecture_IdAndGubun(id, 1L);
		Collections.sort(alList, new Comparator<ApplicationLec>() {

			@Override
			public int compare(ApplicationLec o1, ApplicationLec o2) {
				Long grade1 = o1.getMember().getGrade();
				Long grade2 = o2.getMember().getGrade();
				
				String userid1 = o1.getMember().getUserid();
				String userid2 = o2.getMember().getUserid();
				
				if(grade1 == grade2) {
					return userid1.compareTo(userid2);
				}
				return grade1.compareTo(grade2); // 비교 리턴 -> -1, 0, 1
			}
		});
		
		List<Member> memList = new ArrayList<Member>();
		List<Grade> grList = new ArrayList<Grade>();
		Map<String, Object> map = new HashMap<>();
		
		for (ApplicationLec applicationLec : alList) {
			memList.add(applicationLec.getMember());
			grList.add(gr.findByApplicationLec(applicationLec));
		}
	
		gradeExcelDown(response, memList, grList);

//		List<Map> appliMap = memGrList.stream()
//						 .map(memGrade -> obm.convertValue(memGrade, Map.class))
//						 .collect(Collectors.toList());
		System.out.println("GradeServiceImpl lecScoreExcel end");
		return null;
	}

	private void gradeExcelDown(HttpServletResponse response, List<Member> memList, List<Grade> grList) {
		try {
			System.out.println("excel make");
			System.out.println("excel memList===> " + memList);
			System.out.println("excel grList===> " + grList);
			Workbook workbook = new SXSSFWorkbook();
			Sheet sheet = workbook.createSheet("강의성적표");
			
			//숫자 포맷처리 : -->  numCellStyle을 적용
			CellStyle numCellStyle = workbook.createCellStyle();
			CellStyle backYellow = workbook.createCellStyle();
			//배경색 지정
			backYellow.setFillForegroundColor(IndexedColors.YELLOW.index); 
			backYellow.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			numCellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
				
			//파일명 처리
			final String fileName = "강의성적표";
			//헤더 처리
			final String[] header = {"번호", "학번", "학년", "이름", "전공", "출결점수", "중간점수", "기말점수", "과제점수",
									 "총점", "등급"};
			Row row = sheet.createRow(0);
			for(int i = 0; i < header.length; i++) {
				
				Cell cell = row.createCell(i);
				cell.setCellStyle(backYellow);
				cell.setCellValue(header[i]);
			}
			
			//바디 처리
			for(int i = 0; i < memList.size(); i++) {
				row = sheet.createRow(i + 1); // 헤더 이후로 출력되어야 해서 +1한다.
				
				Cell cell = null;
				cell = row.createCell(0);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(i+1); // 출석점수
				
				cell = row.createCell(1);
				cell.setCellValue(grList.get(i).getApplicationLec().getMember().getUserid()); // 학번
				
				cell = row.createCell(2);
				cell.setCellValue(memList.get(i).getGrade()); // 학년
				
				cell = row.createCell(3);
				cell.setCellValue(memList.get(i).getName()); // 이름
				
				cell = row.createCell(4);
				cell.setCellValue(memList.get(i).getMajor()); // 전공
				
				cell = row.createCell(5);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(grList.get(i).getAttendance()); // 출석
				
				cell = row.createCell(6);
				cell.setCellStyle(numCellStyle); 
				cell.setCellValue(grList.get(i).getMidterm()); // 중간
				
				cell = row.createCell(7);
				cell.setCellStyle(numCellStyle); 
				cell.setCellValue(grList.get(i).getFinals()); // 기말
				
				cell = row.createCell(8);
				cell.setCellStyle(numCellStyle); 
				cell.setCellValue(grList.get(i).getReport()); // 과제
				
				cell = row.createCell(9);
				cell.setCellStyle(numCellStyle);
				cell.setCellValue((double)((grList.get(i).getAttendance() * 0.2) + (grList.get(i).getMidterm() * 0.3) + 
								  (grList.get(i).getFinals() * 0.3) + (grList.get(i).getReport() * 0.2))); // 총점
				
				cell = row.createCell(10);
				cell.setCellStyle(numCellStyle);
				cell.setCellValue(grList.get(i).getTotal()); // 등급
			}
			response.setContentType("application/vnd.ms-ecxcel");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8")+".xlsx");
		
			// 중간중간 임시파일 만들어 OOM 방지
			OutputStream tempFile = response.getOutputStream();
			workbook.write(tempFile);
			tempFile.close();
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
			((SXSSFWorkbook) workbook).dispose();
			System.out.println("excel make end");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
