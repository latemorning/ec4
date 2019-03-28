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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cnslt.service.CnsltntMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

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
public class EC4CnsltntMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4ComIndexController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltntMngService")
    private EC4CnsltntMngService cnsltntMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 상담원정보조회팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltntPop.do")
    public String openEC4CnsltntPop(@ModelAttribute("cnsltntMngVO") CnsltntMngVO cnsltntMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cnsltntMngVO.setRegister(loginVO.getUniqId());
        cnsltntMngVO.setUpdusr(loginVO.getUniqId());
        
        
        
        LOGGER.debug("EC4CnsltntMngController 상담원조회 popup is called ");
        
        return "egovframework/ec4/call/cnslt/EC4CnsltntPop";
    }





    /**
	 * 목록을 조회한다
	 * @param MblMembInfoMngVO cnsltntMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltntMngList.do")
    public @ResponseBody String cnsltntMngList(@ModelAttribute("cnsltntMngVO") CnsltntMngVO cnsltntMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cnsltntMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cnsltntMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cnsltntMngService.selectCnsltntMngList(cnsltntMngVO);
        int totalCount = cnsltntMngService.selectCnsltntMngListCnt(cnsltntMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cnsltntMngVO.getsEcho());

        return wrapperVO.toJson();
    }

}
