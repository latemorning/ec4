package egovframework.ec4.call.outbd.smt.prm.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageDefaultVO;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("replcManageDAO")
public class ReplcManageDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectReplcManageList(ReplcManageDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("replcManageDAO.selectReplcManageList", searchVO);
    }


    public int selectReplcManageListCnt(ReplcManageDefaultVO searchVO) throws Exception {

        return (int)select("replcManageDAO.selectReplcManageListCnt", searchVO);
    }


    public void insertReplcManage(ReplcManageVO replcManageVO) throws Exception {

        insert("replcManageDAO.insertReplcManage", replcManageVO);
    }


    public EgovMap selectReplcManage(ReplcManageVO replcManageVO) throws Exception {

        return (EgovMap)select("replcManageDAO.selectReplcManage", replcManageVO);
    }


    public void updateReplcManage(ReplcManageVO replcManageVO) throws Exception {

        update("replcManageDAO.updateReplcManage", replcManageVO);
    }


    public void deleteReplcManage(ReplcManageVO replcManageVO) throws Exception {

        delete("replcManageDAO.deleteReplcManage", replcManageVO);
    }

}
