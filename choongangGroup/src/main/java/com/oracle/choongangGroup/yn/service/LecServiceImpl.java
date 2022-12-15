package com.oracle.choongangGroup.yn.service;

import java.io.OutputStream;
import java.net.URLEncoder;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.yn.repository.LecApplicationRepository;
import com.oracle.choongangGroup.yn.repository.LecRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class LecServiceImpl implements LecService {
	
	private final LecRepository lr;
	private final LecApplicationRepository ar;
	private final ObjectMapper obm;
	
	@Override  
	public List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun) {
		return ar.findByLecture_IdAndGubun(id, gubun);
	}

	// 엑셀 내보내기
	public Object getLecCheck(HttpServletResponse response, boolean excelDown, Long id) {
		List<ApplicationLec> memList = ar.findByLecture_IdAndGubun(id, 1L);
		
		if(excelDown) {
			lecExcelDownload(response, memList);
			return null; // 없으면 에러
		}
		List<Map> appliMap = memList.stream()
							 .map(applicationLec -> obm.convertValue(applicationLec, Map.class))
							 .collect(Collectors.toList());
		
		return appliMap;
	}

	//엑셀 다운 구현
	private void lecExcelDownload(HttpServletResponse response, List<ApplicationLec> memList) {
		try {
//			Workbook workbook = new XSSFWorkbook();

			// SXSSF 사용
			Workbook workbook = new SXSSFWorkbook();
			Sheet sheet = workbook.createSheet("강의 출석부");
			
			//숫자 포맷처리 : -->  numCellStyle을 적용
			CellStyle numCellStyle = workbook.createCellStyle();
			CellStyle backYellow = workbook.createCellStyle();
			//배경색 지정
			backYellow.setFillForegroundColor(IndexedColors.YELLOW.index); 
			backYellow.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			numCellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
				
			//파일명 처리
			final String fileName = "강의출석부";
			
			//헤더 처리
			final String[] header = {"번호", "이름", "학년", "학번", "출석점수"};
			Row row = sheet.createRow(0);
			for(int i = 0; i < header.length; i++) {
				
				Cell cell = row.createCell(i);
				cell.setCellStyle(backYellow);
				cell.setCellValue(header[i]);
			}
			
			//바디 처리
			for(int i = 0; i < memList.size(); i++) {
				row = sheet.createRow(i + 1); // 헤더 이후로 출력되어야 해서 +1한다.
				
				ApplicationLec applicationLec = memList.get(i);
				
				Cell cell = null;
				cell = row.createCell(0);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(i+1); // 출석점수
				
				cell = row.createCell(1);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(applicationLec.getMember().getName()); // 출석점수
				
				cell = row.createCell(2);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(applicationLec.getMember().getGrade()); // 출석점수
				
				cell = row.createCell(3);
				cell.setCellStyle(numCellStyle); // 숫자 포맷 사용
				cell.setCellValue(applicationLec.getMember().getUserid()); // 출석점수
				
			}
			
			response.setContentType("application/vnd.ms-ecxcel");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8")+".xlsx");
			// 파일명은 URLEncoder로 감싸주는게 좋다.
//			workbook.write(response.getOutputStream());
//			workbook.close();
		
			// 중간중간 임시파일 만들어 OOM 방지
			OutputStream tempFile = response.getOutputStream();
			workbook.write(tempFile);
			tempFile.close();
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
			((SXSSFWorkbook) workbook).dispose();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
