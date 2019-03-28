package egovframework.ec4.cmm.zip.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 도로명 주소 controller
 *
 * @author harry
 *
 */
@Controller
public class EC4RdnmadrController {

    /**
     * 도로명주소 검색 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/zip/rdnmadrSearchPopup.do")
    public String rdnmadrSearchPopup(ModelMap model) throws Exception {

        return "egovframework/ec4/cmm/zip/EC4RdnmadrSearchPopup";
    }
}
