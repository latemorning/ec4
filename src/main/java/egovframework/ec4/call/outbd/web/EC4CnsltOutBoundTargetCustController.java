package egovframework.ec4.call.outbd.web;


import java.util.ArrayList;
import java.util.List;

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
import egovframework.ec4.call.outbd.service.EC4CnsltOutBoundTargetCustService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cnslt.service.CnsltntMngVO;
import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.call.outbd.service.CallScriptMngVO;
import egovframework.ec4.call.outbd.service.CnsltOutBoundTargetCustVO;
import egovframework.ec4.call.outbd.service.EC4CallScriptMngService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 controller 클래스를 정의한다.
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
public class EC4CnsltOutBoundTargetCustController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltOutBoundTargetCustController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltOutBoundTargetCustService")
    private EC4CnsltOutBoundTargetCustService cnsltOutBoundTargetCustService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;

    @Resource(name = "callScriptMngService")
    private EC4CallScriptMngService callScriptMngService;

    @Resource(name = "cnsltntMngService")
    private EC4CnsltntMngService cnsltntMngService;
    
    
    


    /**
	 * 아웃바운드콜상담 대상고객정보 상담 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/cnsltOutBoundTargetCustList.do")
    public String openEC4CnsltOutBoundTargetCust(@ModelAttribute("searchTargetCustVO") CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO, ModelMap model)
            throws Exception {


        LOGGER.debug("EC4CnsltOutBoundTargetCustList 아웃바운드콜상담 대상고객정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
    	

        // 콜진행상태
        codeVO.setCodeId("CLSTTCD");
        List<CmmnDetailCode> callStateList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callStateList", callStateList);
    	

        // 콜배정상태
        codeVO.setCodeId("CALLASIGN");
        List<CmmnDetailCode> callAsignList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callAsignList", callAsignList);
    	

        // 콜구분
        codeVO.setCodeId("CALLCOLECTGB");
        List<CmmnDetailCode> callColectGbList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callColectGbList", callColectGbList);

        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);
        
        // 스크립트제목
        CallScriptMngVO callScriptMngVO = new CallScriptMngVO();
        List<CmmnDetailCode> scriptTitleList = callScriptMngService.selectScriptTitleComboList(callScriptMngVO);
        model.addAttribute("scriptTitleList", scriptTitleList);
        
        
        //담당자
        CnsltntMngVO cnsltntMngVO = new CnsltntMngVO();
        List<CmmnDetailCode> callCnsltList = cnsltntMngService.selectCnsltntComboList(cnsltntMngVO);
        model.addAttribute("callCnsltList", callCnsltList);
        
        
        return "egovframework/ec4/call/outbd/EC4CnsltOutBoundTargetCustList";
    }
    
    /**
     * 대상고객 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/searchCnsltOutBoundTargetCustList.do")
    public @ResponseBody String searchCnsltOutBoundTargetCustList(@ModelAttribute("searchTargetCustVO") CnsltOutBoundTargetCustVO searchVO, ModelMap model, HttpServletRequest request)
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

        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+searchVO.getCnsltTyCn()+"]");
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
        ArrayList<EgovMap> callTargetCustList = cnsltOutBoundTargetCustService.searchCnsltOutBoundTargetCustList(searchVO);
        int totalCount = cnsltOutBoundTargetCustService.searchCnsltOutBoundTargetCustListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");        
        
        /*int cnsltTyCnt=0;
        ArrayList<EgovMap> callTargetCustList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
            String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
            String sTypeCnCode = "";
            for(int i=0; i<aryTypeCnCode.length;i++) {
                searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
                callTargetCustList.addAll(cnsltOutBoundTargetCustService.searchCnsltOutBoundTargetCustList(searchVO));
                cnsltTyCnt++;
            }
        }
        int totalCount = cnsltTyCnt;*/        
        
        
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callTargetCustList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    /**
	 * 아웃바운드콜상담 대상고객팝업 업로드 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/cnsltOutBoundTargetCustPop.do")
    public String openEC4CnsltOutBoundTargetCust_POP(@ModelAttribute("popSearchTargetCustVO") CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO, ModelMap model)
            throws Exception {


        LOGGER.debug("salesLeadRegMng SALES리드 판매정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");//통화유형   대화검색/web챗/유선통화.......
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT"); //상담결과   통화종료/호전환.......
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");//상담구분   일반접수/클레임접수/VOC
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");//브랜드
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");//차종
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        
        // 콜구분
        codeVO.setCodeId("CALLCOLECTGB");
        List<CmmnDetailCode> callColectGbList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callColectGbList", callColectGbList);

        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);
        
        // 스크립트제목
        CallScriptMngVO callScriptMngVO = new CallScriptMngVO();
        List<CmmnDetailCode> scriptTitleList = callScriptMngService.selectScriptTitleComboList(callScriptMngVO);
        model.addAttribute("scriptTitleList", scriptTitleList);
        
        model.addAttribute("scriptIdText", egovMessageSource.getMessage("callScript.scriptCd"));
        model.addAttribute("questIdText", egovMessageSource.getMessage("callScript.questCd"));
        model.addAttribute("ansrIdText", egovMessageSource.getMessage("callScript.ansrCd"));
        
        
        
        return "egovframework/ec4/call/outbd/EC4CnsltOutBoundTargetCustPop";
    }




    /**
	 * Excel리스트의 고객정보를 DB에서 조회한다
	 * @param CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO
	 * @return String
	 * @exception Exception listCnsltTargetCustTable
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCnsltTargetCustDBLoad.do")
    public @ResponseBody String selectCnsltTargetCustDBLoad(@ModelAttribute("popUpTargetCustVO") CnsltOutBoundTargetCustVO searchVO, ModelMap model, HttpServletRequest request)
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
    	
    	ArrayList<EgovMap> cnsltTargetCustList = cnsltOutBoundTargetCustService.selectCnsltTargetCustDBLoad(searchVO);
    	
    	int totalCount = cnsltTargetCustList.toArray().length;//cnsltOutBoundTargetCustService.selectCnsltTargetCustDBLoadCnt(searchVO);
    	

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltTargetCustList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    




    /**
     * Excel리스트 대상고객정보 등록 액션
     *
     * @param cnsltOutBoundTargetCustVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/insertCnsltTargetCust.do")
    public @ResponseBody String insertCnsltTargetCust(@ModelAttribute("popUpInsertTargetCustVO") CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+cnsltOutBoundTargetCustVO.toString());
        //System.out.println("##################################["+cnsltOutBoundTargetCustVO.getCnsltUserId());
        //System.out.println("##################################("+cnsltOutBoundTargetCustVO.getTargetCustNo());

        if (isAuthenticated) {
        	
            beanValidator.validate(cnsltOutBoundTargetCustVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltOutBoundTargetCustVO.setRegister(loginVO.getUniqId());
            	cnsltOutBoundTargetCustVO.setUpdusr(loginVO.getUniqId());
            	
            	cnsltOutBoundTargetCustService.insertCnsltTargetCust(cnsltOutBoundTargetCustVO);
                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    
    
    



    /**
	 * 목록을 조회한다
	 * @param CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCnsltOutBoundTargetCustList.do")
    public String selectEC4CnsltOutBoundTargetCust(@ModelAttribute("cnsltOutBoundTargetCustVO") CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/outbd/EC4CnsltOutBoundTargetCustList";
    }

}
