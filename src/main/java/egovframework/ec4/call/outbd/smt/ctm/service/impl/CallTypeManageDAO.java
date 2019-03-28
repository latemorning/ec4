package egovframework.ec4.call.outbd.smt.ctm.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.smt.ctm.service.CallTypeManageDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("callTypeManageDAO")
public class CallTypeManageDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallTypeManageList(CallTypeManageDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("callTypeManageDAO.selectCallTypeManageList", searchVO);
    }


    public int selectCallTypeManageListCnt(CallTypeManageDefaultVO searchVO) throws Exception {

        return (int)select("callTypeManageDAO.selectCallTypeManageListCnt", searchVO);

    }

}