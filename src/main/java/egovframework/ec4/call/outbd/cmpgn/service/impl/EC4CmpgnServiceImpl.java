package egovframework.ec4.call.outbd.cmpgn.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.cmpgn.service.CmpgnDefaultVO;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnVO;
import egovframework.ec4.call.outbd.cmpgn.service.EC4CmpgnService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 캠페인 관리
 *
 * @author harry
 * @since 2018.06.25
 */
@Service("cmpgnService")
public class EC4CmpgnServiceImpl extends EgovAbstractServiceImpl implements EC4CmpgnService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CmpgnServiceImpl.class);

    @Resource(name = "cmpgnDAO")
    private CmpgnDAO cmpgnDAO;

    /** ID Generation */
    @Resource(name = "ec4CmpgnIdGnrService")
    private EgovIdGnrService cmpgnIdGnrService;


    /*
     * 캠페인 목록
     */
    @Override
    public ArrayList<EgovMap> selectCmpgnList(CmpgnDefaultVO searchVO) throws Exception {

        return cmpgnDAO.selectCmpgnList(searchVO);
    }


    /*
     * 캠페인 목록 카운트
     */
    @Override
    public int selectCmpgnListCnt(CmpgnDefaultVO searchVO) throws Exception {

        return cmpgnDAO.selectCmpgnListCnt(searchVO);
    }


    /*
     * 캠페인 등록 액션
     */
    @Override
    public void insertCmpgn(CmpgnVO cmpgnVO) throws Exception {

        LOGGER.debug(cmpgnVO.toString());

        /** ID Generation Service */
        String cmpgnId = cmpgnIdGnrService.getNextStringId();

        cmpgnVO.setCmpgnId(cmpgnId);

        LOGGER.debug(cmpgnVO.toString());

        cmpgnDAO.insertCmpgn(cmpgnVO);
    }


    /*
     * 캠페인 detail
     */
    @Override
    public EgovMap selectCmpgn(CmpgnVO cmpgnVO) throws Exception {

        return cmpgnDAO.selectCmpgn(cmpgnVO);
    }


    /*
     * 캠페인 수정 액션
     */
    @Override
    public void updateCmpgn(CmpgnVO cmpgnVO) throws Exception {

        cmpgnDAO.updateCmpgn(cmpgnVO);
    }


    /*
     * 캠페인 삭제 액션
     */
    @Override
    public void deleteCmpgn(CmpgnVO cmpgnVO) throws Exception {

        cmpgnDAO.deleteCmpgn(cmpgnVO);
    }

}
