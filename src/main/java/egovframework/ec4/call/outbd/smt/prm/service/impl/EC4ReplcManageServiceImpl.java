package egovframework.ec4.call.outbd.smt.prm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.smt.prm.service.EC4ReplcManageService;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageDefaultVO;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("replcManageService")
public class EC4ReplcManageServiceImpl extends EgovAbstractServiceImpl implements EC4ReplcManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4ReplcManageServiceImpl.class);

    @Resource(name = "replcManageDAO")
    private ReplcManageDAO replcManageDAO;


    /** ID Generation */
    //    @Resource(name = "ec4ReplcManageIdGnrService")
    //    private EgovIdGnrService replcManageIdGnrService;

    @Override
    public ArrayList<EgovMap> selectReplcManageList(ReplcManageDefaultVO searchVO) throws Exception {

        return replcManageDAO.selectReplcManageList(searchVO);
    }


    @Override
    public int selectReplcManageListCnt(ReplcManageDefaultVO searchVO) throws Exception {

        return replcManageDAO.selectReplcManageListCnt(searchVO);
    }


    @Override
    public void insertReplcManage(ReplcManageVO replcManageVO) throws Exception {

        replcManageDAO.insertReplcManage(replcManageVO);
    }


    @Override
    public EgovMap selectReplcManage(ReplcManageVO replcManageVO) throws Exception {

        return replcManageDAO.selectReplcManage(replcManageVO);
    }


    @Override
    public void updateReplcManage(ReplcManageVO replcManageVO) throws Exception {

        replcManageDAO.updateReplcManage(replcManageVO);
    }


    @Override
    public void deleteReplcManage(ReplcManageVO replcManageVO) throws Exception {

        replcManageDAO.deleteReplcManage(replcManageVO);
    }

}
