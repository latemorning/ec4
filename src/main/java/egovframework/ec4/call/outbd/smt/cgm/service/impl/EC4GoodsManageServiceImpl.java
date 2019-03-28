package egovframework.ec4.call.outbd.smt.cgm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.smt.cgm.service.EC4GoodsManageService;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageDefaultVO;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("goodsManageService")
public class EC4GoodsManageServiceImpl extends EgovAbstractServiceImpl implements EC4GoodsManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4GoodsManageServiceImpl.class);

    /** ID Generation */
    @Resource(name = "ec4GoodsManageIdGnrService")
    private EgovIdGnrService goodsManageIdGnrService;

    @Resource(name = "goodsManageDAO")
    private GoodsManageDAO goodsManageDAO;


    @Override
    public ArrayList<EgovMap> selectGoodsManageList(GoodsManageDefaultVO searchVO) throws Exception {

        return goodsManageDAO.selectGoodsManageList(searchVO);
    }


    @Override
    public int selectGoodsManageListCnt(GoodsManageDefaultVO searchVO) throws Exception {

        return goodsManageDAO.selectGoodsManageListCnt(searchVO);
    }


    @Override
    public void deleteGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        goodsManageDAO.deleteGoodsManage(goodsManageVO);
    }


    @Override
    public void insertGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        /** ID Generation Service */
        String goodsCode = goodsManageIdGnrService.getNextStringId();

        goodsManageVO.setGoodsCode(goodsCode);

        goodsManageDAO.insertGoodsManage(goodsManageVO);
    }


    @Override
    public EgovMap selectGoodsManage(GoodsManageDefaultVO searchVO) throws Exception {

        return goodsManageDAO.selectGoodsManage(searchVO);
    }


    @Override
    public void updateGoodsManage(GoodsManageVO goodsManageVO) throws Exception {

        goodsManageDAO.updateGoodsManage(goodsManageVO);
    }

}
