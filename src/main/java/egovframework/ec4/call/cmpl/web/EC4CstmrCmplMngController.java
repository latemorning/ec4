package egovframework.ec4.call.cmpl.web;


import java.util.ArrayList;

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
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.call.cmpl.service.EC4CstmrCmplMngService;
import egovframework.ec4.cmm.service.ComboWrapperVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4DefaultVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeDefaultVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeVO;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;


/**
 * 불만접수에 관한 controller 클래스를 정의한다.
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
public class EC4CstmrCmplMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CstmrCmplMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cstmrCmplMngService")
    private EC4CstmrCmplMngService cstmrCmplMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 불만 접수화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/cstmrCmplMng.do")
    public String openEC4CstmrCmplMng()
            throws Exception {
        return "egovframework/ec4/call/cmpl/EC4CstmrCmplMng";
    }


    /**
	 * 불만 접수처리화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/cstmrCmplProcessList.do")
    public String openEC4CmplProcessList()
            throws Exception {
        return "egovframework/ec4/call/cmpl/EC4CstmrCmplProcessList";
    }


    /**
	 * 불만 접수현황화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/cstmrCmplSttusList.do")
    public String openEC4CmplSttusList()
            throws Exception {
        return "egovframework/ec4/call/cmpl/EC4CstmrCmplSttusList";
    }




    /**
	 * 목록을 조회한다
	 * @param CnsltDclzMngVO cstmrCmplMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/selectCstmrCmplMng.do")
    public String selectEC4CstmrCmplMng(@ModelAttribute("cstmrCmplMngVO") CstmrCmplMngVO cstmrCmplMngVO,
    		                        ModelMap model)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "egovframework/ec4/call/cmpl/EC4CstmrCmplMng";
    }


    /**
     * SCMS 불만코드리스트 popup
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/cmpl/cmplCdScmsPop.do")
    public String popupCmplCdScms(@ModelAttribute("searchVO") EC4DefaultVO searchVO, @ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, ModelMap model) throws Exception {

        LOGGER.debug("EC4CstmrCmplMngController SCMS불만코드 popup is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());

        return "egovframework/ec4/call/cmpl/EC4CmplCdScmsPop";
    }


    /**
     * SCMS 불만코드리스트 popup
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/cmpl/cmplCdCcmsPop.do")
    public String popupCmplCdCcms(@ModelAttribute("searchVO") EC4DefaultVO searchVO, @ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, ModelMap model) throws Exception {

        LOGGER.debug("EC4CstmrCmplMngController CCMS불만코드 popup is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());

        return "egovframework/ec4/call/cmpl/EC4CmplCdCcmsPop";
    }


    /**
     *
     * 상담유형 목록 조회 grid server-side
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cmpl/selectScmsCmplCdList.do")
    public @ResponseBody String selectCallCmplCdList(@ModelAttribute("searchVO") CstmrCmplMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        int totalCount = 0;
        ArrayList<EgovMap> cmplCdList = new ArrayList<EgovMap>();

        //if (StringUtils.isNotBlank(searchVO.getSearchParntsCodeId()) && StringUtils.isNotBlank(searchVO.getSearchCnsltSeCode())) {

            cmplCdList = (ArrayList<EgovMap>)cstmrCmplMngService.selectScmsCmplCdList(searchVO);
            totalCount = cstmrCmplMngService.selectScmsCmplCdListCnt(searchVO);
        //}

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cmplCdList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        //wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * <pre>
     * 불만코드 콤보
     * </pre>
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cmpl/selectScmsCmplCdComboList.do")
    public @ResponseBody String selectScmsCmplCdComboList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();

        if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {

            codeList = (ArrayList<CmmnDetailCode>)cstmrCmplMngService.selectScmsCmplCdComboList(searchVO);
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }

}
