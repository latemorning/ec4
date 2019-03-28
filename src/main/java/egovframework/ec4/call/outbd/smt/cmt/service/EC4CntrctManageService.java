package egovframework.ec4.call.outbd.smt.cmt.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4CntrctManageService {

    ArrayList<EgovMap> selectCntrctManageList(CntrctManageDefaultVO searchVO) throws Exception;

    int selectCntrctManageListCnt(CntrctManageDefaultVO searchVO) throws Exception;

}
