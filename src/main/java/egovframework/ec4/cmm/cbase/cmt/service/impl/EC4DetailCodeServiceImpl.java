package egovframework.ec4.cmm.cbase.cmt.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.ec4.cmm.cbase.cmt.service.EC4DetailCodeService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상세코드 관리
 *
 * @author harry
 * @since 2018.05.16
 */
@Service("detailCodeService")
public class EC4DetailCodeServiceImpl implements EC4DetailCodeService {

    @SuppressWarnings("unused")
    private static final Logger LOGGER = LoggerFactory.getLogger(EC4DetailCodeServiceImpl.class);

    @Resource(name = "detailCodeDAO")
    private DetailCodeDAO detailCodeDAO;


    /*
     * 상세코드 목록
     */
    @Override
    public ArrayList<EgovMap> selectDetailCodeList(DetailCodeDefaultVO searchVO) throws Exception {

        return detailCodeDAO.selectDetailCodeList(searchVO);
    }


    /*
     * 상세코드 카운트
     */
    @Override
    public int selectDetailCodeListCnt(DetailCodeDefaultVO searchVO) throws Exception {

        return detailCodeDAO.selectDetailCodeListCnt(searchVO);
    }


    /*
     * 상세코드 등록
     */
    @Override
    public void insertDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        detailCodeDAO.insertDetailCode(detailCodeVO);
    }


    /*
     * 상세코드 수정
     */
    @Override
    public void updateDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        detailCodeDAO.updateDetailCode(detailCodeVO);
    }


    /*
     * 상세코드 상세 (1건)
     */
    @Override
    public EgovMap selectDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        return detailCodeDAO.selectDetailCode(detailCodeVO);
    }


    /*
     * 상세코드 삭제
     */
    @Override
    public void deleteDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        detailCodeDAO.deleteDetailCode(detailCodeVO);
    }

}
