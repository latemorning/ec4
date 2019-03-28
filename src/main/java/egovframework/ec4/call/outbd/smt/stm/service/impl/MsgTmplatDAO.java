package egovframework.ec4.call.outbd.smt.stm.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatDefaultVO;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("msgTmplatDAO")
public class MsgTmplatDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectMsgTmplatList(MsgTmplatDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("msgTmplatDAO.selectMsgTmplatList", searchVO);
    }


    public int selectMsgTmplatListCnt(MsgTmplatDefaultVO searchVO) throws Exception {

        return (int)select("msgTmplatDAO.selectMsgTmplatListCnt", searchVO);
    }


    public void asgnTmplat(MsgTmplatVO msgTmplatVO) throws Exception {

        update("msgTmplatDAO.asgnTmplat", msgTmplatVO);
    }


    public void relisTmplat(MsgTmplatVO msgTmplatVO) throws Exception {

        update("msgTmplatDAO.relisTmplat", msgTmplatVO);
    }

}