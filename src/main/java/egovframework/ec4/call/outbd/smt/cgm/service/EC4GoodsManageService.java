package egovframework.ec4.call.outbd.smt.cgm.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4GoodsManageService {

    ArrayList<EgovMap> selectGoodsManageList(GoodsManageDefaultVO searchVO) throws Exception;

    int selectGoodsManageListCnt(GoodsManageDefaultVO searchVO) throws Exception;

    void deleteGoodsManage(GoodsManageVO goodsManageVO) throws Exception;

    void insertGoodsManage(GoodsManageVO goodsManageVO) throws Exception;

    EgovMap selectGoodsManage(GoodsManageDefaultVO searchVO) throws Exception;

    void updateGoodsManage(GoodsManageVO goodsManageVO) throws Exception;

}
