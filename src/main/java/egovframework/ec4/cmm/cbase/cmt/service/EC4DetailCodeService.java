package egovframework.ec4.cmm.cbase.cmt.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상세코드 관리
 *
 * @author harry
 * @since 2018.05.16
 */
public interface EC4DetailCodeService {

    ArrayList<EgovMap> selectDetailCodeList(DetailCodeDefaultVO searchVO) throws Exception;


    int selectDetailCodeListCnt(DetailCodeDefaultVO searchVO) throws Exception;


    void insertDetailCode(DetailCodeVO detailCodeVO) throws Exception;


    void updateDetailCode(DetailCodeVO detailCodeVO) throws Exception;


    EgovMap selectDetailCode(DetailCodeVO detailCodeVO) throws Exception;


    void deleteDetailCode(DetailCodeVO detailCodeVO) throws Exception;

}
