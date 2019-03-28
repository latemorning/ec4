package egovframework.ec4.cbot.mreg.web;


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
import egovframework.ec4.cbot.mreg.service.EC4MblMembInfoMngService;
import egovframework.ec4.cbot.mreg.service.MblMembInfoMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

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
public class EC4MblMembInfoMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "mblMembInfoMngService")
    private EC4MblMembInfoMngService mblMembInfoMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 신규고객등록화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cbot/mreg/mblMembRegi.do")
    public String openEC4MblMembRegi()
            throws Exception {
        return "egovframework/ec4/cbot/mreg/EC4MblMembRegi";
    }





    /**
	 * 목록을 조회한다
	 * @param MblMyMngVO mblMembInfoMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/selectMblMembInfoMng.do")
    public String selectEC4MblMembInfoMng(@ModelAttribute("mblMembInfoMngVO") MblMembInfoMngVO mblMembInfoMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/cnslt/EC4MblMembInfoMng";
    }

}
