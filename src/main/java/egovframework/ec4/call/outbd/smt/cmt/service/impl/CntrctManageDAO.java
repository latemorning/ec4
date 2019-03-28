package egovframework.ec4.call.outbd.smt.cmt.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.smt.cmt.service.CntrctManageDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("cntrctManageDAO")
public class CntrctManageDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCntrctManageList(CntrctManageDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cntrctManageDAO.selectCntrctManageList", searchVO);
    }


    public int selectCntrctManageListCnt(CntrctManageDefaultVO searchVO) throws Exception {

        return (int)select("cntrctManageDAO.selectCntrctManageListCnt", searchVO);
    }
}