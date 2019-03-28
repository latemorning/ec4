package egovframework.ec4.cmm.cbase.bpc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cbase.bpc.service.EC4BussplcService;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcDefaultVO;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 차량모델 관리 ServiceImpl
 *
 * @author harry
 * @since 2018.04.16
 */
@Service("bussplcService")
public class EC4BussplcServiceImpl extends EgovAbstractServiceImpl implements EC4BussplcService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4BussplcServiceImpl.class);

    @Resource(name = "bussplcDAO")
    private BussplcDAO bussplcDAO;





    /*
     * SCMS 목록 조회
     *
     * @see egovframework.ec4.cmm.cbase.bpc.service.BussplcService#selectBussplcList(egovframework.ec4.cmm.cbase.bpc.service.BussplcDefaultVO)
     */
    @Override
    public List<CmmnDetailCode> selectBussplcSCMSCombList(CmmnDetailCode searchVO) throws Exception {

        return bussplcDAO.selectBussplcSCMSCombList(searchVO);
    }


    /*
     * CCMS 목록 조회
     *
     * @see egovframework.ec4.cmm.cbase.bpc.service.BussplcService#selectBussplcList(egovframework.ec4.cmm.cbase.bpc.service.BussplcDefaultVO)
     */
    @Override
    public List<CmmnDetailCode> selectBussplcCCMSCombList(CmmnDetailCode searchVO) throws Exception {

        return bussplcDAO.selectBussplcCCMSCombList(searchVO);
    }







}
