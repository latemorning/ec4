package egovframework.ec4.cmm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4CmmUseService {

    List<EgovMap> selectPopupTestlList(PopupTestDefaultVO searchVO) throws Exception;


    int selectPopupTestlListCnt(PopupTestDefaultVO searchVO) throws Exception;

}
