package egovframework.ec4.cmm.cinfo.cmt.service;

import egovframework.ec4.cmm.cinfo.ctm.service.CstmrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 고객 관리
 *
 * @author harry
 * @since 2018.07.26
 */
public interface EC4CstmrService {

    /**
     * 고객 상세
     *
     * @param cstmrVO
     * @return
     * @throws Exception
     */
    EgovMap selectCstmr(CstmrVO cstmrVO) throws Exception;

}
