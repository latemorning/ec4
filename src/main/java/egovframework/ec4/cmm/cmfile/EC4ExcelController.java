package egovframework.ec4.cmm.cmfile;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.ibm.icu.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;





/**
 * 상담원에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4ExcelController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4ExcelController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
	private DefaultBeanValidator beanValidator;

    



    /**
     *
     * 액셀파일 업로드 목록 조회 grid server-side
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     * 
     */
    @RequestMapping(value = "/ec4/cmm/cmfile/excelImportList.do")
    public @ResponseBody String excelImportList(@ModelAttribute("searchVO") CnsltTypeDefaultVO searchVO, ModelMap model, HttpServletRequest req, @RequestParam Map<String,Object> paramMap)
            throws Exception {
    	
		// 엑셀파일
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		CommonsMultipartFile pFile = (CommonsMultipartFile) multipartRequest.getFile("fileObj");
		

LOGGER.info(" > paramMap : " + paramMap);


		String fileName = pFile.getOriginalFilename();
		
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObject = (JSONObject)jsonParser.parse((String) paramMap.get("cellInfo"));
	    JSONArray jsonColsNumberArray = (JSONArray)jsonObject.get("useColsNumber");
	    JSONArray jsonColsFieldArray = (JSONArray)jsonObject.get("useColsField");
	
	

 
		int iTotRows = 0;
		Workbook tempWorkbook;
		if( fileName.endsWith("xls") ) {
			tempWorkbook = new HSSFWorkbook(pFile.getInputStream());
		}
		else if( fileName.endsWith("xlsx") ) {
			//tempWorkbook = WorkbookFactory.create(pFile.getInputStream());
			tempWorkbook = new XSSFWorkbook(pFile.getInputStream());
		}
		else {
		    //throw new IllegalAccessError("Excel 파일(xls, xlsx)만 가능합니다.");
		    throw new egovframework.rte.fdl.cmmn.exception.EgovBizException("ddddddddddddddd");
		}
	
		ArrayList<EgovMap> excelDatas = new ArrayList<>();


		try {
		    Sheet sheet = tempWorkbook.getSheetAt(0);
		    FormulaEvaluator evaluator = tempWorkbook.getCreationHelper().createFormulaEvaluator();
		
		    int iRow, iCol, iStartRow;
	
		    // jsonObject 에 담긴 startRow 는 디버깅을 해보면 Long 형식이다. 그래서 int형으로 바꿔서 한다.
		    iStartRow = (int)((long)jsonObject.get("startRow"));

		    		
		    for( iRow = iStartRow; iRow < sheet.getPhysicalNumberOfRows(); iRow++ ) {
		        Row row = sheet.getRow(iRow);
		        Map<String, Object> excelData = new EgovMap();
		        String cellString = "";
		
		        excelData.clear();
		        
		        for( iCol = 0; iCol < jsonColsNumberArray.size(); iCol++ ) {
		        	if(null == row.getCell((int)(long)jsonColsNumberArray.get(iCol)) || "".equals(row.getCell((int)(long)jsonColsNumberArray.get(iCol))) || "null".equals(row.getCell((int)(long)jsonColsNumberArray.get(iCol)))){
		        		continue;
		        	}
		        		
		            Cell cell = row.getCell((int)(long)jsonColsNumberArray.get(iCol));
		            
		
		            switch( cell.getCellType() ) {
		                case Cell.CELL_TYPE_FORMULA :
		                    cellString = cell.getCellFormula();
		                    break;
		
		                case Cell.CELL_TYPE_STRING :
		                    cellString = cell.getStringCellValue();
		                    break;
		
		                case Cell.CELL_TYPE_NUMERIC :
		                    if( org.apache.poi.ss.usermodel.DateUtil.isCellDateFormatted(cell) ) {
		                        Date date = cell.getDateCellValue();
		                        cellString = new SimpleDateFormat("yyyy-MM-dd").format(date);
		                    }
		                    else {
		                        cell.setCellType(Cell.CELL_TYPE_STRING);
		                        cellString = cell.getStringCellValue();
		                    }
		                    break;
		
		                case Cell.CELL_TYPE_BOOLEAN :
		                    cellString = String.valueOf(cell.getBooleanCellValue());
		                    break;
		
		                case Cell.CELL_TYPE_ERROR :
		                    cellString = String.valueOf(cell.getErrorCellValue());
		                    break;
		
		                case Cell.CELL_TYPE_BLANK :
		                    cellString = "";
		                    break;
		
		                default :
		                    CellValue evaluate = evaluator.evaluate(cell);
		                    if( evaluate != null )
		                        cellString = evaluate.formatAsString();
		                    else
		                        cellString = "";
		                    break;
		            }
		            iTotRows++;
		            
		            excelData.put((String)jsonColsFieldArray.get(iCol), cellString.replaceAll("\\s+$", ""));
		        }


		        excelDatas.add((EgovMap)excelData);
		    }
		}
		catch(Exception e) {
			LOGGER.error("errorerrorerrorerrorerror["+e.getMessage());
		}




		/*		
		File convFile = new File(request.getName());
		request.transferTo(convFile);

		// 엑셀 파일 오픈
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(convFile));

		Cell cell = null;
		// 첫번재 sheet 내용 읽기
		for (Row row : wb.getSheetAt(0)) {
			// 셋째줄부터..
			if (row.getRowNum() < 2) {
				continue;
			}

			// 두번째 셀이 비어있으면 for문을 멈춘다.
			if (row.getCell(1) == null) {
				break;
			}

			// 콘솔 출력
			System.out.println("[row] 이름 : " + row.getCell(1) + ", 나이: " + row.getCell(2) + ", 성별: "
					+ row.getCell(3) + ", 비고: " + row.getCell(4));
		}*/
		
		
		/*
        // 정렬할 필드명 셋팅
        //searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        int totalCount = 0;

        ArrayList<EgovMap> cnsltTypeList = new ArrayList<EgovMap>();
        if (StringUtils.isNotBlank(searchVO.getSearchParntsCodeId()) && StringUtils.isNotBlank(searchVO.getSearchCnsltSeCode())) {

            cnsltTypeList = (ArrayList<EgovMap>)cnsltTypeService.selectCnsltTypeList(searchVO);
            totalCount = cnsltTypeService.selectCnsltTypeListCnt(searchVO);
        }
         * 
         * */

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(excelDatas);
        wrapperVO.setiTotalRecords(iTotRows);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(iTotRows);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    /**
    *
    * 액셀파일 업로드 목록 조회 grid server-side
    *
    * @param searchVO
    * @param model
    * @param request
    * @return
    * @throws Exception
    * 
    */
   @RequestMapping(value = "/ec4/cmm/cmfile/excelImportList2.do")
    public static List<String[]> excelImportList2(InputStream is) throws Exception {
    	Workbook workbook = WorkbookFactory.create(is);
    	System.out.println("///////////////["+workbook.toString()+"]");
    	//Sheet sheet = workbook.getSheetAt(sheetIndex);
    	List<String[]> data = new ArrayList<>();
    	/*for (int i = sheet.getFirstRowNum(); i <= sheet.getLastRowNum(); i++) {
    		Row row = sheet.getRow(i);
    		if (row == null) continue;
    		int last = row.getLastCellNum();
    		String[] rowData = new String[last];
    		for (int j = 0; j < last; j++) {
    			Cell cell = row.getCell(j);
    			rowData[j] = cell == null ? null : getCellString(cell);
    		}
    		data.add(rowData);
    	}*/
    	return data;
    }    
    
    
    
    
    
    /**
     * Get Workbook
     * 
     * @param completeFilePath
     * @param fileExtension
     * @return workbook
     * @throws ParserException
     */
    @RequestMapping(value = "/ec4/cmm/cmfile/excelImportList3.do")
    private Sheet loadSheetByName(final File file, final String name) throws InvalidFormatException, IOException {

    	System.out.println("++++++++++++++++++++++++++++++++++++++++++++++");
    	System.out.println("///////////////["+file.toString()+"]");
        try(InputStream in = new FileInputStream(file)) {
            Workbook workbook = WorkbookFactory.create(in);
            
            final int sheetNum = workbook.getNumberOfSheets();
            for(int i=0; i < sheetNum; i++) {
                
                final Sheet sheet = workbook.getSheetAt(i);
                final String sheetName = sheet.getSheetName();
                if(sheetName.equals(name)) {
                    return sheet;
                }
            }
        }
        
        throw new IllegalStateException("not found sheet : " + name);
    }
    
    
    

}
