package egovframework.ec4.cmm.cbase.bpc.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 차량관리 service
 *
 * @author harry
 */
public interface EC4BussplcService {



    /**
     * SCMS 사업소콤버 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<CmmnDetailCode> selectBussplcSCMSCombList(CmmnDetailCode searchVO) throws Exception;


    /**
     * CCMS 사업소콤버 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<CmmnDetailCode> selectBussplcCCMSCombList(CmmnDetailCode searchVO) throws Exception;






}
