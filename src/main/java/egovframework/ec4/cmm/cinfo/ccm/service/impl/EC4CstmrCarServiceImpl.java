package egovframework.ec4.cmm.cinfo.ccm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarDefaultVO;
import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarVO;
import egovframework.ec4.cmm.cinfo.ccm.service.EC4CstmrCarService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("cstmrCarService")
public class EC4CstmrCarServiceImpl extends EgovAbstractServiceImpl implements EC4CstmrCarService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CstmrCarServiceImpl.class);

    @Resource(name = "cstmrCarDAO")
    private CstmrCarDAO cstmrCarDAO;


    /** ID Generation */
    //    @Resource(name = "ec4CstmrCarIdGnrService")
    //    private EgovIdGnrService cstmrCarIdGnrService;

    /*
     * 고객차량 목록
     */
    @Override
    public ArrayList<EgovMap> selectCstmrCarList(CstmrCarDefaultVO searchVO) throws Exception {

        LOGGER.debug("-- cstmrCarService.selectCstmrCarList --");

        return cstmrCarDAO.selectCstmrCarList(searchVO);
    }


    /*
     * 고객차량 목록 카운트
     */
    @Override
    public int selectCstmrCarListCnt(CstmrCarDefaultVO searchVO) throws Exception {

        return cstmrCarDAO.selectCstmrCarListCnt(searchVO);
    }


    /*
     * 고객차량 상세
     */
    @Override
    public EgovMap selectCstmrCar(CstmrCarVO cstmrCarVO) throws Exception {

        return cstmrCarDAO.selectCstmrCar(cstmrCarVO);
    }

}
