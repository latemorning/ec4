package egovframework.ec4.call.outbd.web;


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
import egovframework.ec4.call.outbd.service.EC4CnsltAppntBussPlcSetMngService;
import egovframework.ec4.call.outbd.service.CnsltAppntBussPlcSetMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

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
public class EC4CnsltAppntBussPlcSetMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltAppntBussPlcSetMngService")
    private EC4CnsltAppntBussPlcSetMngService cnsltAppntBussPlcSetMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;


    /**
	 * 아웃바운드콜상담 대상고객정보 상담 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/cnsltAppntBussPlcSetMng.do")
    public String openEC4CnsltAppntBussPlcSetMng()
            throws Exception {
        return "egovframework/ec4/call/outbd/EC4CnsltAppntBussPlcSetMng";
    }




    /**
	 * 목록을 조회한다
	 * @param CnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCnsltAppntBussPlcSetMng.do")
    public String selectEC4CnsltAppntBussPlcSetMng(@ModelAttribute("cnsltAppntBussPlcSetMngVO") CnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/outbd/EC4CnsltAppntBussPlcSetMng";
    }

}
