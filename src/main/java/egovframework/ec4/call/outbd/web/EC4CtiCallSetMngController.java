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
import egovframework.ec4.call.outbd.service.EC4CtiCallSetMngService;
import egovframework.ec4.call.outbd.service.CtiCallSetMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * CTI설정에 관한 controller 클래스를 정의한다.
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
public class EC4CtiCallSetMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ctiCallSetMngService")
    private EC4CtiCallSetMngService ctiCallSetMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;


    /**
	 * CTI설정 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/ctiCallSetMng.do")
    public String openEC4CtiCallSetMng()
            throws Exception {
        return "egovframework/ec4/call/outbd/EC4CtiCallSetMng";
    }




    /**
	 * 목록을 조회한다
	 * @param CarSosReceiptMngVO ctiCallSetMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCtiCallSetMng.do")
    public String selectEC4CtiCallSetMng(@ModelAttribute("ctiCallSetMngVO") CtiCallSetMngVO ctiCallSetMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/outbd/EC4CtiCallSetMng";
    }

}
