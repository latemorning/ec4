package egovframework.ec4.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.service.EC4CmmUseService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("ec4CmmUseService")
public class EC4CmmUseServiceImpl extends EgovAbstractServiceImpl implements EC4CmmUseService {

    @Resource(name = "ec4CmmUseDAO")
    private EC4CmmUseDAO ec4CmmUseDAO;


    @Override
    public List<EgovMap> selectPopupTestlList(PopupTestDefaultVO searchVO) throws Exception {

        return ec4CmmUseDAO.selectPopupTestlList(searchVO);
    }


    @Override
    public int selectPopupTestlListCnt(PopupTestDefaultVO searchVO) throws Exception {

        return ec4CmmUseDAO.selectPopupTestlListCnt(searchVO);
    }

}
