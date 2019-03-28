package egovframework.ec4.call.cmpl.web;


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
import egovframework.ec4.call.cmpl.service.EC4RepairResvRequestMngService;
import egovframework.ec4.call.cmpl.service.RepairResvRequestMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

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
public class EC4RepairResvRequestMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "repairResvRequestMngService")
    private EC4RepairResvRequestMngService repairResvRequestMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 정비예약요청화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/repairResvRequestMng.do")
    public String openEC4RepairResvRequestMng()
            throws Exception {
        return "egovframework/ec4/call/cmpl/EC4RepairResvRequestMng";
    }

    

    /**
	 * 정비예약요청화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/repairResvRequestList.do")
    public String openEC4RepairResvRequestList()
            throws Exception {
        return "egovframework/ec4/call/cmpl/EC4RepairResvRequestMng";
    }




    /**
	 * 목록을 조회한다
	 * @param RepairResvRequestMngVO repairResvRequestMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cmpl/selectRepairResvRequestMng.do")
    public String selectEC4RepairResvRequestMng(@ModelAttribute("repairResvRequestMngVO") RepairResvRequestMngVO repairResvRequestMngVO,
    		                        ModelMap model)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "egovframework/ec4/call/cmpl/EC4RepairResvRequestMng";
    }

}
