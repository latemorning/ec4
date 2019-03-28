package egovframework.ec4.call.outbd.smt.ctm.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4CallTypeManageService {

    ArrayList<EgovMap> selectCallTypeManageList(CallTypeManageDefaultVO searchVO) throws Exception;

    int selectCallTypeManageListCnt(CallTypeManageDefaultVO searchVO) throws Exception;

}
