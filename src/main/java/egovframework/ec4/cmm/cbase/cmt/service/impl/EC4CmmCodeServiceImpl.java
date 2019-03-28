package egovframework.ec4.cmm.cbase.cmt.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeVO;
import egovframework.ec4.cmm.cbase.cmt.service.EC4CmmCodeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 공통코드 관리
 *
 * @author harry
 * @since 2018.05.15
 */
@Service("cmmCodeService")
public class EC4CmmCodeServiceImpl extends EgovAbstractServiceImpl implements EC4CmmCodeService {

    @SuppressWarnings("unused")
    private static final Logger LOGGER = LoggerFactory.getLogger(EC4CmmCodeServiceImpl.class);

    @Resource(name = "cmmCodeDAO")
    private CmmCodeDAO cmmCodeDAO;


    /*
     * 공통코드 목록
     *
     */
    @Override
    public ArrayList<EgovMap> selectCmmCodeList(CmmCodeDefaultVO searchVO) throws Exception {

        return cmmCodeDAO.selectCmmCodeList(searchVO);
    }


    /*
     * 공통코드 목록 카운트
     *
     */
    @Override
    public int selectCmmCodeListCnt(CmmCodeDefaultVO searchVO) throws Exception {

        return cmmCodeDAO.selectCmmCodeListCnt(searchVO);
    }


    /*
     * 공통코드 삭제
     *
     */
    @Override
    public void deleteCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        cmmCodeDAO.deleteCmmCode(cmmCodeVO);
    }


    /*
     * 공통코드 등록
     *
     */
    @Override
    public void insertCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        cmmCodeDAO.insertCmmCode(cmmCodeVO);
    }


    /*
     * 공통코드 상세 (1건)
     *
     */
    @Override
    public EgovMap selectCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        return cmmCodeDAO.selectCmmCode(cmmCodeVO);
    }


    /*
     * 공통코드 수정
     *
     */
    @Override
    public void updateCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        cmmCodeDAO.updateCmmCode(cmmCodeVO);
    }

}
