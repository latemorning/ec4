package egovframework.ec4.cmm.cbase.cmt.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 공통코드 관리
 *
 * @author harry
 * @since 2018.05.15
 */
public interface EC4CmmCodeService {

    ArrayList<EgovMap> selectCmmCodeList(CmmCodeDefaultVO searchVO) throws Exception;


    int selectCmmCodeListCnt(CmmCodeDefaultVO searchVO) throws Exception;


    void deleteCmmCode(CmmCodeVO cmmCodeVO) throws Exception;


    void insertCmmCode(CmmCodeVO cmmCodeVO) throws Exception;


    EgovMap selectCmmCode(CmmCodeVO cmmCodeVO) throws Exception;


    void updateCmmCode(CmmCodeVO cmmCodeVO) throws Exception;

}
