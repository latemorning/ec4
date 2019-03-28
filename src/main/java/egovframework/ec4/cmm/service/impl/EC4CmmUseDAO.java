package egovframework.ec4.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ec4CmmUseDAO")
public class EC4CmmUseDAO extends EgovComAbstractDAO {

    @SuppressWarnings("unchecked")
    public List<EgovMap> selectPopupTestlList(PopupTestDefaultVO searchVO) throws Exception {

        return (List<EgovMap>)list("ec4CmmUseDAO.selectPopupTestList", searchVO);
    }


    public int selectPopupTestlListCnt(PopupTestDefaultVO searchVO) throws Exception {

        return (int)select("ec4CmmUseDAO.selectPopupTestListCnt", searchVO);
    }

}
