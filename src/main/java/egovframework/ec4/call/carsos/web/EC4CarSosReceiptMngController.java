package egovframework.ec4.call.carsos.web;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.ec4.call.carsos.service.EC4CarSosReceiptMngService;
import egovframework.ec4.cmm.cbase.cmt.service.EC4DetailCodeService;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.call.carsos.service.CarSosReceiptMngVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 긴급출동에 관한 controller 클래스를 정의한다.
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
public class EC4CarSosReceiptMngController {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CarSosReceiptMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "carSosReceiptMngService")
    private EC4CarSosReceiptMngService carSosReceiptMngService;

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
    @Resource(name = "ec4EmergencyIdGnrService")
    private EgovIdGnrService carEmergencyGnrService;
    
    
    @Resource(name = "cstmrIntgrMngService")
    private EC4CstmrIntgrMngService cstmrIntgrMngService; 

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;


    /**
	 * 긴급출동 접수화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/carSosReceiptMng.do")
    public String openEC4CarSosReceiptMng(@ModelAttribute("carSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO, ModelMap model) 
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        carSosReceiptMngVO.setFrstRegisterId(loginVO.getUniqId());
        carSosReceiptMngVO.setLastUpdusrId(loginVO.getUniqId());
       
        
        
        LOGGER.debug("openEC4CarSosReceiptMng 긴급출동접수 is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
    	
        return "egovframework/ec4/call/carsos/EC4CarSosReceiptMng";
    }
    



    /**
	 * 긴급출동 접수팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/selectCarSosReceiptRegPop.do")
    public String selectCarSosReceiptRegPop(@ModelAttribute("popUpCarSosMngVO") CarSosReceiptMngVO carSosReceiptMngVO, ModelMap model) 
            throws Exception { 
        
        LOGGER.debug("selectCarSosReceiptRegPop 긴급출동접수팝업 is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
    	
        return "egovframework/ec4/call/carsos/EC4CarSosReceiptRegPop";
    }
    
    
    
    


    /**
	 * 긴급출동 이력화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/carSosReceiptHistList.do")
    public String openEC4CarSosReceiptHist(@ModelAttribute("searchCarSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO, ModelMap model) 
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        carSosReceiptMngVO.setFrstRegisterId(loginVO.getUniqId());
        carSosReceiptMngVO.setLastUpdusrId(loginVO.getUniqId());
       
        
        
        LOGGER.debug("openEC4CarSosReceiptMng 긴급출동접수이력 is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
    	
        return "egovframework/ec4/call/carsos/EC4CarSosReceiptHistList";
    }




    /**
	 * 목록을 조회한다
	 * @param CarSosReceiptMngVO carSosReceiptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/selectCarSosReceiptMng.do")
    public String selectEC4CarSosReceiptMng(@ModelAttribute("carSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO,
    		                        ModelMap model)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "egovframework/ec4/call/carsos/EC4CarSosReceiptMng";
    }




    /**
	 * 긴급출동접수목록이력을 조회한다
	 * @param CarSosReceiptMngVO carSosReceiptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/selectCarSosReceiptHistList.do")
    public @ResponseBody String selectCarSosReceiptHistList(@ModelAttribute("searchVO") CarSosReceiptMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));
        
        
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
        ArrayList<EgovMap> carSosReceiptHistList = carSosReceiptMngService.selectCarSosReceiptHistList(searchVO);
        int totalCount = carSosReceiptMngService.selectCarSosReceiptHistListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");          
        
        /*int cnsltTyCnt=0;
    	ArrayList<EgovMap> carSosReceiptHistList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
        	String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
        	String sTypeCnCode = "";
        	for(int i=0; i<aryTypeCnCode.length;i++) {
        		searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
        		carSosReceiptHistList.addAll(carSosReceiptMngService.selectCarSosReceiptHistList(searchVO));
        		cnsltTyCnt++;
        	}
        }
        int totalCount = cnsltTyCnt;*/

        	
        	
        

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(carSosReceiptHistList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }





    /**
	 * 긴급출동접수 저장한다
	 * @param CarSosReceiptMngVO carSosReceiptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/ec4/call/carsos/insertCarSosReceiptReg.do")
    public @ResponseBody String insertCarSosReceiptReg(@ModelAttribute("carSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO, BindingResult bindingResult, @RequestParam Map commandMap, ModelMap model) throws Exception {

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
                beanValidator.validate(carSosReceiptMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                }
                

        	    
        	    //신규고객일 경우 신규고객등록
        	    if(null == carSosReceiptMngVO.getCstmrCd() || "".equals(carSosReceiptMngVO.getCstmrCd()) || "null".equals(carSosReceiptMngVO.getCstmrCd()) || "single".equals(carSosReceiptMngVO.getCstmrCd())){
            		//String strCustId = callCustIdGnrService.getNextStringId();
            		CstmrIntgrMngVO cstmrIntgrMngVO = new CstmrIntgrMngVO();
    				cstmrIntgrMngVO.setCstmrNm(carSosReceiptMngVO.getCstmrNm());                        /* 콜고객명 */
    				cstmrIntgrMngVO.setHpno(carSosReceiptMngVO.getSearchHpno());                           /* 핸드폰번호 */
    				cstmrIntgrMngVO.setTelno("");                          /* 전화번호 */
    				cstmrIntgrMngVO.setBrthdy("");                         /* 생년월일 */
    				cstmrIntgrMngVO.setEmailAdres(carSosReceiptMngVO.getEmailAdres());                     /* 이메일주소 */
    				cstmrIntgrMngVO.setEmailDomain(carSosReceiptMngVO.getEmailDomain());                    /* 이메일도메인 */
    				cstmrIntgrMngVO.setVhcleNo(carSosReceiptMngVO.getVhcleNo());                        /* 차량번호 */
    				cstmrIntgrMngVO.setVin(carSosReceiptMngVO.getVin());                            /* 차대번호 */
    				cstmrIntgrMngVO.setHouseZip(carSosReceiptMngVO.getZip());                       /* 집우편번호 */
    				cstmrIntgrMngVO.setHouseAdres(carSosReceiptMngVO.getAdres());                     /* 집주소 */
    				cstmrIntgrMngVO.setHouseAdresDetail(carSosReceiptMngVO.getAdresDetl());               /* 집주소상세 */
    				cstmrIntgrMngVO.setOfficeZip("");                      /* 직장우편번호 */
    				cstmrIntgrMngVO.setOfficeAdres("");                    /* 직장주소 */
    				cstmrIntgrMngVO.setOfficeAdresDetail("");              /* 직장주소상세 */
    				cstmrIntgrMngVO.setTelRecvYn("");                      /* 전화수신여부 */
    				cstmrIntgrMngVO.setSmsRecvYn("");                      /* SMS수신여부 */
    				cstmrIntgrMngVO.setEmailRecvYn("");                    /* 이메일수신여부 */
    				cstmrIntgrMngVO.setFaxRecvYn("");                      /* FAX수신여부 */
    				cstmrIntgrMngVO.setDmRecvYn("");                       /* DM수신여부 */
    				cstmrIntgrMngVO.setMberGrad("");                       /* 회원등급 */
    				cstmrIntgrMngVO.setChevMembYn("");                     /* 쉐보레멤버여부 */
    				cstmrIntgrMngVO.setWebMembYn("");                      /* 웹멤버여부 */
    				cstmrIntgrMngVO.setWutoMembYn("");                     /* 오토멤버여부 */
    				cstmrIntgrMngVO.setCstmrMemo("");                      /* 고객메모 */
    				if(
    						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getHpno())
    						||
    						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getEmailAdres())
    						||
    						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getBrthdy())
    						){

    	        		cstmrIntgrMngService.insertCstmrIntgrMng(cstmrIntgrMngVO);	
    	                carSosReceiptMngVO.setCstmrCd(cstmrIntgrMngVO.getCstmrCd());
    	                
    				}
        	    }                

                String carEmergencyId = carEmergencyGnrService.getNextStringId(); 
                carSosReceiptMngVO.setCnsltUserId(loginVO.getUniqId());
                carSosReceiptMngVO.setEmergencyRcptNo(carEmergencyId);
                carSosReceiptMngVO.setRegister(loginVO.getUniqId());
                carSosReceiptMngVO.setRcptUserId(loginVO.getUniqId());
                //carSosReceiptMngVO.setCnsltDt(toYy+"-"+toMm+"-"+toDt);
                //carSosReceiptMngVO.setCnsltTime(toTime);
                
                
        	  //긴급출동 접수내용 저장
        	    carSosReceiptMngService.insertCarSosReceiptReg(carSosReceiptMngVO);


                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
    


                //}
            } else {

                wrapperVO.setSuccess(false);
                wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
            }
            
            return wrapperVO.toJson();
        }





    /**
	 * 긴급출동접수 수정한다
	 * @param CarSosReceiptMngVO carSosReceiptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/ec4/call/carsos/updateCarSosReceiptReg.do")
    public @ResponseBody String updateCarSosReceiptReg(@ModelAttribute("carSosReceiptMngVO") CarSosReceiptMngVO carSosReceiptMngVO, BindingResult bindingResult, @RequestParam Map commandMap, ModelMap model) throws Exception {

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
                beanValidator.validate(carSosReceiptMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                    wrapperVO.setSuccess(false);
                    wrapperVO.setErrors(bindingResult.getAllErrors());

                    wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
                } else {
                	
                	carSosReceiptMngVO.setUpdusr(loginVO.getUniqId());
                	
                	carSosReceiptMngService.updateCarSosReceiptReg(carSosReceiptMngVO);


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
	 * 긴급출동 접수수정팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/carsos/selectCarSosReceiptModPop.do")
    public String selectCarSosReceiptModPop(@ModelAttribute("popUpCarSosMngVO") CarSosReceiptMngVO carSosReceiptMngVO, ModelMap model) 
            throws Exception { 
        
        LOGGER.debug("selectCarSosReceiptRegPop 긴급출동접수수정팝업 is called ");    	
    	
    	
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("VOCKND");
        List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vocKndList", rcptKndList);

        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        carSosReceiptMngVO.setValuesFromEgovMap(carSosReceiptMngService.selectCarSosReceiptModLoad(carSosReceiptMngVO));
    	
        return "egovframework/ec4/call/carsos/EC4CarSosReceiptModPop";
    }
    
    


    

}
