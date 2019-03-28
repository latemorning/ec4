package egovframework.ec4.call.outbd.smt.cmt.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.smt.cmt.service.CntrctManageDefaultVO;
import egovframework.ec4.call.outbd.smt.cmt.service.EC4CntrctManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("cntrctManageService")
public class EC4CntrctManageServiceImpl extends EgovAbstractServiceImpl implements EC4CntrctManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CntrctManageServiceImpl.class);

    @Resource(name = "cntrctManageDAO")
    private CntrctManageDAO cntrctManageDAO;


    /** ID Generation */
    //    @Resource(name = "ec4CntrctManageIdGnrService")
    //    private EgovIdGnrService cntrctManageIdGnrService;

    @Override
    public ArrayList<EgovMap> selectCntrctManageList(CntrctManageDefaultVO searchVO) throws Exception {

        return cntrctManageDAO.selectCntrctManageList(searchVO);
    }


    @Override
    public int selectCntrctManageListCnt(CntrctManageDefaultVO searchVO) throws Exception {

        return cntrctManageDAO.selectCntrctManageListCnt(searchVO);
    }

}
