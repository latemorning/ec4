package egovframework.ec4.call.outbd.smt.ctm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.smt.ctm.service.CallTypeManageDefaultVO;
import egovframework.ec4.call.outbd.smt.ctm.service.EC4CallTypeManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("callTypeManageService")
public class EC4CallTypeManageServiceImpl extends EgovAbstractServiceImpl implements EC4CallTypeManageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CallTypeManageServiceImpl.class);

    @Resource(name = "callTypeManageDAO")
    private CallTypeManageDAO callTypeManageDAO;

    /** ID Generation */
//    @Resource(name = "ec4CallTypeManageIdGnrService")
//    private EgovIdGnrService callTypeManageIdGnrService;

    @Override
    public ArrayList<EgovMap> selectCallTypeManageList(CallTypeManageDefaultVO searchVO) throws Exception {

        return callTypeManageDAO.selectCallTypeManageList(searchVO);
    }

    @Override
    public int selectCallTypeManageListCnt(CallTypeManageDefaultVO searchVO) throws Exception {

        return callTypeManageDAO.selectCallTypeManageListCnt(searchVO);
    }


}
