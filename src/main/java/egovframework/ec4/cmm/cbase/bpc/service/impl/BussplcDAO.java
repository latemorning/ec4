package egovframework.ec4.cmm.cbase.bpc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcDefaultVO;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @author harry
 * @since 2018.04.16
 */
@Repository("bussplcDAO")
public class BussplcDAO extends EgovComAbstractDAO {

    /**
     * SCMS 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectBussplcSCMSCombList(CmmnDetailCode searchVO) throws Exception {

        return (List<CmmnDetailCode>)list("bussplcDAO.selectBussplcSCMSCombList", searchVO);
    }

    /**
     * CCMS 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectBussplcCCMSCombList(CmmnDetailCode searchVO) throws Exception {

        return (List<CmmnDetailCode>)list("bussplcDAO.selectBussplcCCMSCombList", searchVO);
    }


}
