package egovframework.ec4.cmm.cbase.ctm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담유형 관리
 *
 * @author harry
 * @since 2018.05.18
 */
public interface EC4CnsltTypeService {

    List<EgovMap> selectCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception;


    int selectCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception;

    List<EgovMap> selectCallCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception;


    int selectCallCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception;


    void insertCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception;


    EgovMap selectCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception;


    void updateCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception;


    void deleteCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception;

}
