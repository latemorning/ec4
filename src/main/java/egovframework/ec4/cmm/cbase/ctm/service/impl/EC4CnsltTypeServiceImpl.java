package egovframework.ec4.cmm.cbase.ctm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeVO;
import egovframework.ec4.cmm.cbase.ctm.service.EC4CnsltTypeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담유형 관리
 *
 * @author harry
 * @since 2018.05.18
 */
@Service("cnsltTypeService")
public class EC4CnsltTypeServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltTypeService {

    @SuppressWarnings("unused")
    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltTypeServiceImpl.class);

    @Resource(name = "cnsltTypeDAO")
    private CnsltTypeDAO cnsltTypeDAO;


    /*
     * 상담유형 목록 조회
     */
    @Override
    public List<EgovMap> selectCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception {

        return cnsltTypeDAO.selectCnsltTypeList(searchVO);
    }


    /*
     * 상담유형 목록 카운트
     */
    @Override
    public int selectCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception {

        return cnsltTypeDAO.selectCnsltTypeListCnt(searchVO);
    }


    /*
     * 상담유형 목록 조회
     */
    @Override
    public List<EgovMap> selectCallCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception {

        return cnsltTypeDAO.selectCallCnsltTypeList(searchVO);
    }


    /*
     * 상담유형 목록 카운트
     */
    @Override
    public int selectCallCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception {

        return cnsltTypeDAO.selectCallCnsltTypeListCnt(searchVO);
    }


    /*
     * 상담유형 등록
     */
    @Override
    public void insertCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        cnsltTypeDAO.insertCnsltType(cnsltTypeVO);
    }


    /*
     * 상담유형 상세
     */
    @Override
    public EgovMap selectCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        return cnsltTypeDAO.selectCnsltType(cnsltTypeVO);
    }


    /*
     * 상담유형 수정
     */
    @Override
    public void updateCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        cnsltTypeDAO.updateCnsltType(cnsltTypeVO);
    }


    /*
     * 상담유형 삭제
     */
    @Override
    public void deleteCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        cnsltTypeDAO.deleteCnsltType(cnsltTypeVO);
    }

}
