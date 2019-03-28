package egovframework.ec4.cbot.msales.web;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import egovframework.ec4.cbot.msales.service.EC4MblSalesEstimateMngService;
import egovframework.ec4.cbot.msales.service.MblSalesEstimateMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 모바일 견적신청화면에 관한 controller 클래스를 정의한다.
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
public class EC4MblSalesEstimateMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "mblSalesEstimateMngService")
    private EC4MblSalesEstimateMngService mblSalesEstimateMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 모바일 견적신청화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cbot/msales/mblSalesEstimate.do")
    public String openEC4MblSalesEstimateInfo()
            throws Exception {
        return "egovframework/ec4/cbot/msales/EC4MblSalesEstimateInfo";
    }





    /**
	 * 목록을 조회한다
	 * @param MblSalesEstimateMngVO mblSalesEstimateMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/selectMblSalesEstimateMng.do")
    public String selectEC4MblSalesEstimateMng(@ModelAttribute("mblSalesEstimateMngVO") MblSalesEstimateMngVO mblSalesEstimateMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/cnslt/EC4MblSalesEstimateMng";
    }

}
