package egovframework.ec4.call.outbd.smt.stm.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4MsgTmplatService {

    ArrayList<EgovMap> selectMsgTmplatList(MsgTmplatDefaultVO searchVO) throws Exception;

    int selectMsgTmplatListCnt(MsgTmplatDefaultVO searchVO) throws Exception;

    void asgnTmplat(MsgTmplatVO msgTmplatVO) throws Exception;

    void relisTmplat(MsgTmplatVO msgTmplatVO) throws Exception;

}
