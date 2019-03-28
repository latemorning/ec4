package egovframework.ec4.cmm.cinfo.cmt.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cinfo.cmt.service.EC4CstmrService;
import egovframework.ec4.cmm.cinfo.ctm.service.CstmrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("cstmrService")
public class EC4CstmrServiceImpl extends EgovAbstractServiceImpl implements EC4CstmrService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CstmrServiceImpl.class);

    @Resource(name = "cstmrDAO")
    private CstmrDAO cstmrDAO;


    /** ID Generation */
    //    @Resource(name = "ec4CstmrIdGnrService")
    //    private EgovIdGnrService cstmrIdGnrService;

    /*
     * 고객 정보 상세
     */
    @Override
    public EgovMap selectCstmr(CstmrVO cstmrVO) throws Exception {

        LOGGER.debug("-->> EC4CstmrServiceImpl.selectCstmr");

        return cstmrDAO.selectCstmr(cstmrVO);
    }

}
