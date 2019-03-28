package egovframework.ec4.call.cnslt.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import egovframework.ec4.call.cnslt.service.EC4CnsltScheduleMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cnslt.service.CnsltScheduleMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 상담원스케줄에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.03
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.03  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4CnsltScheduleMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4ComIndexController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltScheduleMngService")
    private EC4CnsltScheduleMngService cnsltScheduleMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;

    

    /**
	 * 상담원스케줄관리화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltScheduleMng.do")
    public String openEC4CnsltntPop(@ModelAttribute("cnsltScheduleMngVO") CnsltScheduleMngVO cnsltScheduleMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltScheduleMngVO.setRegister(loginVO.getUniqId());
        cnsltScheduleMngVO.setUpdusr(loginVO.getUniqId());
        
        
        
        LOGGER.debug("EC4CnsltScheduleMngController 상담원스케줄관리 is called ");
        
        return "egovframework/ec4/call/cnslt/EC4CnsltScheduleMng";
    }





    /**
	 * 목록을 조회한다
	 * @param CnsltScheduleMngVO cnsltScheduleMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltScheduleMngList.do")
    public @ResponseBody String cnsltScheduleMngList(@ModelAttribute("cnsltScheduleMngVO") CnsltScheduleMngVO cnsltScheduleMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cnsltScheduleMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cnsltScheduleMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cnsltScheduleMngService.selectCnsltScheduleMngList(cnsltScheduleMngVO);
        int totalCount = cnsltScheduleMngService.selectCnsltScheduleMngListCnt(cnsltScheduleMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cnsltScheduleMngVO.getsEcho());

        return wrapperVO.toJson();
    }

    

    /**
	 * 상담원스케줄관리등록 팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/popCnsltSchedule.do")
    public String openEC4CnsltSchedulePop(@ModelAttribute("popUpMngVO") CnsltScheduleMngVO cnsltScheduleMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltScheduleMngVO.setRegister(loginVO.getUniqId());
        cnsltScheduleMngVO.setUpdusr(loginVO.getUniqId());
        
        
        
        LOGGER.debug("EC4CnsltScheduleMngController 상담원스케줄관리등록팝업 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        
        
        codeVO.setCodeId("THOUR");
        List<CmmnDetailCode> hourList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("hourList", hourList);

        codeVO.setCodeId("TMINUTE");
        List<CmmnDetailCode> minuteList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("minuteList", minuteList);

        codeVO.setCodeId("COM038");
        List<CmmnDetailCode> schdlTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("schdlTypeList", schdlTypeList);
        
        
        
        return "egovframework/ec4/call/cnslt/EC4CnsltSchedulePop";
    }

}
