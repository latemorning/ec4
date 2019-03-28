package egovframework.ec4.cmm.cinfo.cmt.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cinfo.ctm.service.CstmrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 고객 정보
 *
 * @author harry
 * @since 2018.07.26
 */
@Repository("cstmrDAO")
public class CstmrDAO extends EgovComAbstractDAO {

    /**
     * 고객정보 상세
     *
     * @param cstmrVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCstmr(CstmrVO cstmrVO) throws Exception {

        return (EgovMap)select("cstmrDAO.selectCstmr", cstmrVO);
    }

}
