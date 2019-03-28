package egovframework.ec4.call.outbd.smt.prm.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4ReplcManageService {

    ArrayList<EgovMap> selectReplcManageList(ReplcManageDefaultVO searchVO) throws Exception;


    int selectReplcManageListCnt(ReplcManageDefaultVO searchVO) throws Exception;


    void insertReplcManage(ReplcManageVO replcManageVO) throws Exception;


    EgovMap selectReplcManage(ReplcManageVO replcManageVO) throws Exception;


    void updateReplcManage(ReplcManageVO replcManageVO) throws Exception;


    void deleteReplcManage(ReplcManageVO replcManageVO) throws Exception;

}
