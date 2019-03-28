package egovframework.ec4.call.outbd.smt.cgm.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageDefaultVO;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("goodsManageDAO")
public class GoodsManageDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectGoodsManageList(GoodsManageDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("goodsManageDAO.selectGoodsManageList", searchVO);
    }


    public int selectGoodsManageListCnt(GoodsManageDefaultVO searchVO) throws Exception {

        return (int)select("goodsManageDAO.selectGoodsManageListCnt", searchVO);
    }


    public void deleteGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        delete("goodsManageDAO.deleteGoodsManage", goodsManageVO);
    }


    public void insertGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        insert("goodsManageDAO.insertGoodsManage", goodsManageVO);
    }


    public EgovMap selectGoodsManage(GoodsManageDefaultVO searchVO) throws Exception {

        return (EgovMap)select("goodsManageDAO.selectGoodsManage", searchVO);
    }


    public void updateGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        update("goodsManageDAO.updateGoodsManage", goodsManageVO);
    }

}
