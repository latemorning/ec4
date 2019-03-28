package egovframework.ec4.call.inbd.web;


import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.ext.jfile.org.json.JSONObject;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.ec4.call.inbd.service.EC4CnsltInBoundMngService;
import egovframework.ec4.call.outbd.hpcl.service.HpclDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.ec4.cmm.cbase.cmt.service.EC4DetailCodeService;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4DefaultVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;
import egovframework.ec4.call.cmpl.service.EC4CstmrCmplMngService;
import egovframework.ec4.call.carsos.service.CarSosReceiptMngVO;
import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;

/**
 * 인바운드콜 상담에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.13
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.13  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4CnsltInBoundMngController {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltInBoundMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltInBoundMngService")
    private EC4CnsltInBoundMngService cnsltInBoundMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "detailCodeService")
    private EC4DetailCodeService detailCodeService;

    /** ID Generation */
    @Resource(name = "ec4CnsltInBdIdGnrService")
    private EgovIdGnrService cnsltInBdIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CstmrCmplIdGnrService")
    private EgovIdGnrService cstmrCmplIdGnrService;

    
    @Resource(name = "cstmrCmplMngService")
    private EC4CstmrCmplMngService cstmrCmplMngService;
    
    
    @Resource(name = "cstmrIntgrMngService")
    private EC4CstmrIntgrMngService cstmrIntgrMngService;    

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;
    
    


    /**
	 * 인바운드콜 상담 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundMng.do")
    public String openEC4CnsltInBoundMng(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) 
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltInBoundMngVO.setFrstRegisterId(loginVO.getUniqId());
        cnsltInBoundMngVO.setLastUpdusrId(loginVO.getUniqId());
       
        
        
        LOGGER.debug("openEC4CnsltInBoundMng 상담화면(In) is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
    	
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundMng";
    }






    
    
    /**
     * 등록화면 이동
     *
     * @param cnsltInBoundMngVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/registCnsltInBound.do")
    public String registCnsltInBound(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "egovframework/ec4/call/inbd/EC4CnsltInBoundReg";
    }
    



    /**
	 * 고객상담이력 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundHistList.do")
    public String openEC4CnsltInBoundHistList(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltInBoundHistList 고객상담이력 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
            	
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundHistList";
    }


    /**
     * 고객상담이력 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCnsltHistList.do")
    public @ResponseBody String selectCallCnsltHistList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getSearchCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        ArrayList<EgovMap> callCnsltHistList = cnsltInBoundMngService.selectCallCnsltHistList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCnsltHistListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        /*int cnsltTyCnt=0;
    	ArrayList<EgovMap> callCnsltHistList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
        		callCnsltHistList.addAll(cnsltInBoundMngService.selectCallCnsltHistList(searchVO));
        		cnsltTyCnt++;
        	}
        }
        int totalCount = cnsltTyCnt;*/
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltHistList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 리콜내역 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCarRecallList.do")
    public @ResponseBody String selectCallCarRecallList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
        ArrayList<EgovMap> callCarRecallList = cnsltInBoundMngService.selectCallCarRecallList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCarRecallListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCarRecallList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    



    /**
     * 계약/판매이력 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallContSalesList.do")
    public @ResponseBody String selectCallContSalesList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getSearchCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        ArrayList<EgovMap> callContSalesList = cnsltInBoundMngService.selectCallContSalesList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallContSalesListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        /*int cnsltTyCnt=0;
    	ArrayList<EgovMap> callContSalesList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
        		callContSalesList.addAll(cnsltInBoundMngService.selectCallContSalesList(searchVO));
        		cnsltTyCnt++;
        	}
        }
        int totalCount = cnsltTyCnt;*/
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callContSalesList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 개인소모품교환 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCarPeriodList.do")
    public @ResponseBody String selectCallCarPeriodList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
        ArrayList<EgovMap> callCarPeriodList = cnsltInBoundMngService.selectCallCarPeriodList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCarPeriodListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCarPeriodList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    
    
    
    
        

    /**
     * 상담내용저장 popup
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/inbd/cnsltInBoundRegPop.do")
    public String popupCnsltInBoundReg(@ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) throws Exception {

    	//EC4CstmrIntgrMngController.openEC4CstmrIntgrPop    해당 호출함수 내 로직과 동일해야한다. (인바운드 상담내용저장화면 => 고객팝업<>상담내용저장팝업)
    	
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltInBoundMngVO.setFrstRegisterId(loginVO.getUniqId());
        cnsltInBoundMngVO.setLastUpdusrId(loginVO.getUniqId());
        
        
        
        LOGGER.debug("EC4CnsltInBoundMngController 상담내용저장 popup is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);
        model.addAttribute("cnsltBussplcKndList", rcptKndList);
        
        codeVO.setCodeId("COM073");
        List<CmmnDetailCode> cstmrRelList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cstmrRelList", cstmrRelList);
        
        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);
        
        codeVO.setCodeId("CNSLTCUSTKND");
        List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltCustKndList", cnsltCustKndList);

        return "egovframework/ec4/call/inbd/EC4CnsltInBoundRegPop";
    }


    
    
    /**
     * 상담내용저장 등록
     *
     * @param detailCodeVO
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     * 
     * 
     * 
     * 
			ID Generation 사용하기
			
			
			/EC4/src/main/resources/egovframework/spring/ec4/idgn 경로 찾아가서 적당한 이름의 파일에 등록하면 됨
			
			    <!-- ${title comment} -->
			    <bean name="ec4${name_u}IdGnrService" class="egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrServiceImpl" destroy-method="destroy">
			        <property name="dataSource" ref="egov.dataSource" />
			        <property name="strategy"   ref="${name_l}Strategy" />
			        <property name="blockSize"  value="10"/>
			        <property name="table"      value="COMTECOPSEQ"/>
			        <property name="tableName"  value="${tableName}"/>
			    </bean>
			    <bean name="${name_l}Strategy" class="egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl">
			        <property name="prefix"   value="${prefix}" />
			        <property name="cipers"   value="${cipers}" />
			        <property name="fillChar" value="0" />
			    </bean>
			   
			-- 변수 설명
			${title comment}	: comment 입력
			${name_u}			: 프로그램명 대문자					예) 차량모델  VhcleModel
			${name_l}			: 프로그램명 소문자					예) 차량관리  vhcleModel
			${tableName}		: 시퀀스 테이블에 등록한 필드명		예) VHCLE_MODEL_ID
			${prefix}			: 시퀀스 앞에 붙일 문자열			예) VHCLMDL_
			${cipers}			: prefix 뒤에 들어갈 자리수 [prefix길이 + 자릿수 = 20] 에 맞게 설정해주면 됨    "VHCLMDL_"는 8 이니까 12 입력해주면 됨
			
			
			-- 테이블에 등록
			INSERT INTO COMTECOPSEQ (TABLE_NAME, NEXT_ID) VALUES ('${tableName}', '1');
			위 ${tableName} 에 적당한 이름을 넣고 실행해줌
			
			
			-- serviceImpl 에서 아래와 같이 사용함
			
			    ** ID Generation *
			    @Resource(name = "ec4CnsltInBdIdGnrService")				// 전역변수로 선언 위에 bean 설정에서 정한 이름 name="ec4${name_u}IdGnrService"
			    private EgovIdGnrService cnsltInBdIdGnrService;				// 소문자로 인스턴스 생성해서 사용
			
			
			 cnsltInBdIdGnrService.getNextStringId();					// 메서드에서 사용 
     * 
     * 
     * 
     * 
     * 
     */
    @RequestMapping("/ec4/call/inbd/insertCnsltInBoundReg.do")
    public @ResponseBody String insertCnsltInBoundReg(@ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, @ModelAttribute("cstmrCmplMngVO") CstmrCmplMngVO cstmrCmplMngVO, BindingResult bindingResult, @RequestParam Map commandMap, ModelMap model) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);
        
        String toTime = "";
		String pattern = "HH:mm:ss.SSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		toTime = sdfCurrent.format(ts.getTime());
		
        
        
        //System.out.println("isAuthenticated["+isAuthenticated+"]");
        if (isAuthenticated) {
        	//System.out.println("EgovDoubleSubmitHelper.checkAndSaveToken()["+EgovDoubleSubmitHelper.checkAndSaveToken()+"]");
            //if (EgovDoubleSubmitHelper.checkAndSaveToken()) {


            	//System.out.println("#############################################");
                beanValidator.validate(cnsltInBoundMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                }
                

                cnsltInBoundMngVO.setCnsltUserId(loginVO.getUniqId());
                cnsltInBoundMngVO.setRegister(loginVO.getUniqId());
                cnsltInBoundMngVO.setCnsltDt(toYy+"-"+toMm+"-"+toDt);
                cnsltInBoundMngVO.setCnsltTime(toTime);
                
                //상담내용 저장
                //cnsltInBoundMngService.insertCnsltInBoundReg(cnsltInBoundMngVO);
                cnsltInBoundMngService.insertCnsltInBoundRegAll(cnsltInBoundMngVO, cstmrCmplMngVO);
                
                

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
                
                /*
                
                System.out.println("@@@@@@@@@@@@@@@@@@@@@"+commandMap.toString());
                cnsltInBoundMngService.insertCnsltInBoundReg(cnsltInBoundMngVO);
                
                String[] codeIdLv3 	= (String[])commandMap.get("codeIdLv3");
                System.out.println("codeIdLv3["+codeIdLv3.length+"]");
                for(int idx=0; idx<codeIdLv3.length; idx++){
                	Map dataMap = new HashMap();
                	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+codeIdLv3[idx]);
					dataMap.put("makrCd"			, commandMap.get("makrCd"));
					dataMap.put("pgSeq"				, commandMap.get("pgSeq"));
					dataMap.put("targetDealerId"	, "*");
                }
                
                model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));*/


            //}
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }
        //return "forward:/ec4/call/inbd/cnsltInBoundRegPop.do";
        return wrapperVO.toJson();
    }

    	


    /**
     * 상담유형리스트 popup (상담내용저장팝업에서 전체리스트형태 type 리스트 호출)
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/inbd/selectInCallCnsltTypeList.do")
    public @ResponseBody String selectInCallCnsltTypeList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        LOGGER.debug("EC4CnsltInBoundMngController 저장된 상담유형 List is called ");
        
        int totalCount = 0;
        ArrayList<EgovMap> cnsltTypeList = new ArrayList<EgovMap>();

        if (StringUtils.isNotBlank(searchVO.getSearchCnsltIncallNo())) {
        	cnsltTypeList = (ArrayList<EgovMap>)cnsltInBoundMngService.selectInCallCnsltTypeList(searchVO);
        	totalCount = cnsltInBoundMngService.selectInCallCnsltTypeListCnt(searchVO);
        }
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltTypeList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());


        return wrapperVO.toJson();
    }

    	


    /**
     * 상담유형리스트 popup (상담내역에서 팝업호출, 상담내용저장팝업에서 항모별 선택 type리스트호출)
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/inbd/cnsltInBoundTypePop.do")
    public String popupCnsltType(@ModelAttribute("searchVO") EC4DefaultVO searchVO, @ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) throws Exception {

        LOGGER.debug("EC4CnsltInBoundMngController 상담유형 popup is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getSearchCnsltTyCn()+"]");
        /*if(!"".equals(cnsltInBoundMngVO.getSearchCnsltTyCn())){
        	String [] aryTypeCn = cnsltInBoundMngVO.getSearchCnsltTyCn().split("/");
        	String [] aryTypeCnCode = cnsltInBoundMngVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	cnsltInBoundMngVO.setSearchCnsltTyCn(sTypeCn);
        	cnsltInBoundMngVO.setSearchCnsltTyCnCode(sTypeCnCode);
        	if("".equals(cnsltInBoundMngVO.getSearchCnsltSeCode())){
        		cnsltInBoundMngVO.setSearchCnsltSeCode("CNSE020");
        	}
        	
        	ArrayList<EgovMap> cnsltTypeLoad = new ArrayList<EgovMap>();
        	cnsltTypeLoad = (ArrayList<EgovMap>)cnsltInBoundMngService.selectCnsltTypeLoad(cnsltInBoundMngVO);
        	model.addAttribute("cnsltTypeLoad", cnsltTypeLoad);
        }
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+cnsltInBoundMngVO.toString()+"]");*/

        int cnsltTyCnt=0;
    	ArrayList<EgovMap> cnsltTypeLoad = new ArrayList();
        if(!"".equals(cnsltInBoundMngVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = cnsltInBoundMngVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	if("".equals(cnsltInBoundMngVO.getSearchCnsltSeCode())){
        		cnsltInBoundMngVO.setSearchCnsltSeCode("CNSE020");
        	}
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		cnsltInBoundMngVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])) );
        		cnsltTypeLoad.addAll(cnsltInBoundMngService.selectCnsltTypeLoad(cnsltInBoundMngVO));
        	}
        	model.addAttribute("cnsltTypeLoad", cnsltTypeLoad);
        }

        return "egovframework/ec4/call/inbd/EC4CnsltInBoundTypePop";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /**
	 * 고객상담내역조회 화면으로 이동
	 * @param cnsltInBoundMngVO cnsltInBoundMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundList.do")
    public String selectEC4CnsltInBound(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltInBoundList 상담내역조회 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundList";
    }
    
    /**
     * 고객상담내역조회 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCnsltInBoundList.do")
    public @ResponseBody String selectCallCnsltInBoundList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        if("".equals(searchVO.getUniqId()) || null==searchVO.getUniqId())searchVO.setUniqId(loginVO.getUniqId());
        ArrayList<EgovMap> callCnsltList = cnsltInBoundMngService.selectCallCnsltInBoundList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCnsltInBoundListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+cnsltInBoundMngVO.toString()+"]");        
        
        /*if("".equals(searchVO.getUniqId()) || null==searchVO.getUniqId())searchVO.setUniqId(loginVO.getUniqId());
        int cnsltTyCnt=0;
    	ArrayList<EgovMap> callCnsltList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
        		callCnsltList.addAll(cnsltInBoundMngService.selectCallCnsltInBoundList(searchVO));
        		cnsltTyCnt++;
        	}
        }
        int totalCount = cnsltTyCnt;*/
        
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    /**
	 * 고객상담현황 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundStatList.do")
    public String openEC4CnsltInBoundStatList(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltInBoundStatList 상담현황화면 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        codeVO.setCodeId("CNSLTCUSTKND");
        List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltCustKndList", cnsltCustKndList);
        
        
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundStatList";
    }
    
    /**
     * 고객상담내역조회 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCnsltInBoundStatList.do")
    public @ResponseBody String selectCallCnsltInBoundStatList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        if("".equals(searchVO.getUniqId()) || null==searchVO.getUniqId())searchVO.setUniqId(loginVO.getUniqId());
        ArrayList<EgovMap> callCnsltList = cnsltInBoundMngService.selectCallCnsltInBoundStatList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCnsltInBoundStatListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");  
        
        /*if("".equals(searchVO.getUniqId()) || null==searchVO.getUniqId())searchVO.setUniqId(loginVO.getUniqId());
        int cnsltTyCnt=0;
    	ArrayList<EgovMap> callCnsltList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
        		callCnsltList.addAll(cnsltInBoundMngService.selectCallCnsltInBoundStatList(searchVO));
        		cnsltTyCnt++;
        	}
        }
        int totalCount = cnsltTyCnt;*/        
        
        
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




    /**
	 * 의뢰현황 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundReqList.do")
    public String openEC4CnsltInBoundReqList(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltInBoundReqList 의뢰현황 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        codeVO.setCodeId("CNSLTCUSTKND");
        List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltCustKndList", cnsltCustKndList);
        
        
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundReqList";
    }


    /**
     * 의뢰현황 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/selectCallCnsltReqList.do")
    public @ResponseBody String selectCallCnsltReqList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }


        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        ArrayList<EgovMap> callCnsltHistList = cnsltInBoundMngService.selectCallCnsltReqList(searchVO);
        int totalCount = cnsltInBoundMngService.selectCallCnsltReqListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");
        
        
        /*int cnsltTyCnt=0;
        ArrayList<EgovMap> callCnsltHistList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
            String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
            String sTypeCnCode = "";
            for(int i=0; i<aryTypeCnCode.length;i++) {
                searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
                callCnsltHistList.addAll(cnsltInBoundMngService.selectCallCnsltReqList(searchVO));
                cnsltTyCnt++;
            }
        }
        int totalCount = cnsltTyCnt;*/        
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltHistList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    


    /**
	 * 인바운드콜 CR매니저상담처리 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/cnsltInBoundMgrProc.do")
    public String openEC4CnsltInBoundMgrProc(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) 
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltInBoundMngVO.setFrstRegisterId(loginVO.getUniqId());
        cnsltInBoundMngVO.setLastUpdusrId(loginVO.getUniqId());
       
        
        
        LOGGER.debug("openEC4CnsltInBoundMgrProc CR매니저 상담처리 is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);
        model.addAttribute("cnsltBussplcKndList", rcptKndList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("CNSLTCUSTKND");
        List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltCustKndList", cnsltCustKndList);
    	
        return "egovframework/ec4/call/inbd/EC4CnsltInBoundMgrProc";
    }


    /**
     * 매니저처리 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/cnsltInBoundMgrProcList.do")
    public @ResponseBody String selectCnsltInBoundMgrProcList(@ModelAttribute("searchVO") CnsltInBoundMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+cnsltInBoundMngVO.getCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        ArrayList<EgovMap> callCnsltMgrProcList = new ArrayList();
        callCnsltMgrProcList.addAll(cnsltInBoundMngService.selectCnsltInBoundMgrProcList(searchVO));
        int totalCount = cnsltInBoundMngService.selectCnsltInBoundMgrProcListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        
        /*int cnsltTyCnt=0;
        ArrayList<EgovMap> callCnsltMgrProcList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
            String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
            String sTypeCnCode = "";
            for(int i=0; i<aryTypeCnCode.length;i++) {
                searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
                callCnsltMgrProcList.addAll(cnsltInBoundMngService.selectCnsltInBoundMgrProcList(searchVO));
                cnsltTyCnt++;
            }
        }
        int totalCount = cnsltTyCnt;  */      
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltMgrProcList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
	
	/**
	 * 인바운드상담 매니저처리화면 popup
	 *
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ec4/call/inbd/cnsltInBoundMgrProcPop.do")
	public String popupCnsltInBoundMgrProc(@ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model) throws Exception {
	
		//EC4CstmrIntgrMngController.openEC4CstmrIntgrPop    해당 호출함수 내 로직과 동일해야한다. (인바운드 상담내용저장화면 => 고객팝업<>상담내용저장팝업)
		
	    LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    cnsltInBoundMngVO.setFrstRegisterId(loginVO.getUniqId());
	    cnsltInBoundMngVO.setLastUpdusrId(loginVO.getUniqId());
	    
	    
	    
	    LOGGER.debug("EC4CnsltInBoundMngController 상담내용 매니저처리 popup is called ");
	
	    //model.addAttribute("callbackClass", searchVO.getCallbackClass());
	    
	    ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
	
	    codeVO.setCodeId("VOCKND");
	    List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("vocKndList", rcptKndList);
	    model.addAttribute("cnsltBussplcKndList", rcptKndList);
	    
	    codeVO.setCodeId("COM073");
	    List<CmmnDetailCode> cstmrRelList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("cstmrRelList", cstmrRelList);
	    
	    codeVO.setCodeId("CALLTYPE");
	    List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("callTypeList", callTypeList);
	    
	    codeVO.setCodeId("CNSLTRSLT");
	    List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("cnsltRsltList", cnsltRsltList);
	    
	    codeVO.setCodeId("CNSLTKND");
	    List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("cnsltKndList", cnsltKndList);
	    
	    codeVO.setCodeId("VMCD");
	    List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("vmcdList", vmcdList);
	    
	    codeVO.setCodeId("VHCT");
	    List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("vhctList", vhctList);
	
	    codeVO.setCodeId("EMAILDMN");
	    List<CmmnDetailCode> selectEmailDomainList = cmmUseService.selectCmmCodeDetail(codeVO);
	    model.addAttribute("selectEmailDomainList", selectEmailDomainList);
        
        codeVO.setCodeId("CNSLTCUSTKND");
        List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltCustKndList", cnsltCustKndList);
	    
        if("".equals(cnsltInBoundMngVO.getUniqId()) || null==cnsltInBoundMngVO.getUniqId())cnsltInBoundMngVO.setUniqId(loginVO.getUniqId());
	    cnsltInBoundMngVO.setValuesFromEgovMap(cnsltInBoundMngService.selectCnsltInBoundMgrProcLoad(cnsltInBoundMngVO));
	
	    return "egovframework/ec4/call/inbd/EC4CnsltInBoundMgrProcPop";
	}


    /**
     * 인바운드상담내용 수정 - 매니저처리
     *
     * @param cnsltInBoundMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/updateCnsltMgrProc.do")
    public @ResponseBody String updateCnsltMgrProc(@ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, @ModelAttribute("cstmrCmplMngVO") CstmrCmplMngVO cstmrCmplMngVO, BindingResult bindingResult, @RequestParam Map commandMap, ModelMap model) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);
        
        String toTime = "";
		String pattern = "HH:mm:ss.SSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		toTime = sdfCurrent.format(ts.getTime());
		
        
        
        if (isAuthenticated) {

            beanValidator.validate(cnsltInBoundMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltInBoundMngVO.setRegister(loginVO.getUniqId());
            	cnsltInBoundMngVO.setUpdusr(loginVO.getUniqId());


                //상담내용 수정
                //String cnsltInbdId = cnsltInBdIdGnrService.getNextStringId();
                //cnsltInBoundMngVO.setCnsltUserId(loginVO.getUniqId()); //첫 통화상담원은 변경되면 안된다
                //cnsltInBoundMngVO.setCnsltIncallNo(cnsltInbdId);
                //cnsltInBoundMngVO.setRegister(loginVO.getUniqId());
                //cnsltInBoundMngVO.setCnsltDt(toYy+"-"+toMm+"-"+toDt);
                //cnsltInBoundMngVO.setCnsltTime(toTime);

                //VOC고객불만 신규저장
            	if("Y".equals(cnsltInBoundMngVO.getMgrProcModeYn()) 
            			&& ("".equals(cstmrCmplMngVO.getCmplRecptSeq()) || "0".equals(cstmrCmplMngVO.getCmplRecptSeq()) || null == cstmrCmplMngVO.getCmplRecptSeq()  )){  //상담구분 voc(불만)
            		
            		if("".equals(cstmrCmplMngVO.getCmplMngNo()) || null == cstmrCmplMngVO.getCmplMngNo()){
    	                String cstmrCmplId = cstmrCmplIdGnrService.getNextStringId();  //매니저 처리는 신규로 작성하도록 변경20181228    기존에는 상담원저장시 신규생성했었다
    	                cstmrCmplMngVO.setCmplMngNo(cstmrCmplId);
            		}
	                cstmrCmplMngVO.setCnsltIncallNo(cnsltInBoundMngVO.getCnsltIncallNo());
	                cstmrCmplMngVO.setProcMgrUserId(loginVO.getUniqId());
	                cstmrCmplMngVO.setRegister(loginVO.getUniqId());
	                cstmrCmplMngVO.setMakrCd("GM");
	        	    cstmrCmplMngVO.setRegistDe(toYy+"-"+toMm+"-"+toDt);
	        	    cstmrCmplMngVO.setCmplRecptDt(toYy+"-"+toMm+"-"+toDt);
	        	    //cstmrCmplMngVO.setCmplRecptSeq("1");  //sql에서 MAX + 1 처리한다
	        	    cstmrCmplMngVO.setCallBoundKnd("IN");  //인바운드:IN,  아웃바운드:OUT   인바운드콜 불만인지 아웃바운드콜 불만인지 구분을위함
            	}
        	                    
        	    
                //상담내용 수정
                cnsltInBoundMngService.updateCnsltInBoundRegAll(cnsltInBoundMngVO, cstmrCmplMngVO);
                
                
                /*//상담분류 선택저장
                //if(!"".equals(cnsltInBoundMngVO.getListCnsltTypeTable())){
                    cnsltInBoundMngService.insertCnsltTypeReg(cnsltInBoundMngVO);
                //}

        	    
                cstmrCmplMngService.insertCstmrCmplReg(cstmrCmplMngVO);*/


                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.update"));
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 고객정보 load   인바운드콜, 긴급출동에서 호출한다
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/loadCstmrLastInfo.do")
    public @ResponseBody String loadCstmrLastInfo(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, @ModelAttribute("carSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO, ModelMap model)
            throws Exception {
    	
        LOGGER.debug("loadCstmrLastInfo 고객정보 load is called ");
        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());

        
        // select
        JSONObject object = new JSONObject();
		object.put("ok",true);
        try{
    		object.put("result", cnsltInBoundMngService.loadCstmrLastInfo(cnsltInBoundMngVO));
        }catch(Exception e){
    		object.put("ok",false);
    		object.put("message",e.getMessage());
        }
		System.out.println(object);
        //model.addAttribute("data", object.toString());
		return object.toString();


		/*String result = "";
		String toJson = new Gson().toJson(cnsltInBoundMngService.loadCstmrLastInfo(cnsltInBoundMngVO));
		result += "{\"result\":"+toJson+"}";
		return result;*/
        
        //return wrapperVO.toJson();
    }
    
    
    
    
    
    
}
