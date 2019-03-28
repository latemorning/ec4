package egovframework.ec4.call.outbd.cnslt.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.cnslt.service.OutbdCnsltVO;

/**
 * 아웃바운드 상담
 *
 * @author harry
 * @since 2018.07.26
 */
@Repository("outbdCnsltDAO")
public class OutbdCnsltDAO extends EgovComAbstractDAO {

    /**
     * 해피콜 처리 이력 상담결과 등록
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void insertCnsltResult(OutbdCnsltVO outbdCnsltVO) throws Exception {

        insert("outbdCnsltDAO.insertCnsltResult", outbdCnsltVO);
    }


    /**
     * 해피콜 인터페이스 테이블의 진행상태 및 상담결과 업데이트
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateIntrfcResult(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateIntrfcResult", outbdCnsltVO);
    }


    /**
     * <pre>
     * 수신동의 처리
     * 나중에 고객관리 패키지로 이동 바람...
     * 2018-08-20 harry
     * </pre>
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateRecptnAgre(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateRecptnAgre", outbdCnsltVO);
    }


    /**
     * <pre>
     * 블랙리스트
     * 나중에 고객관리 패키지로 이동 바람...
     * 2018-08-21 harry
     * </pre>
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateBlclst(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateBlclst", outbdCnsltVO);
    }


    /**
     * <pre>
     * 이동전화 변경
     * 나중에 고객관리 패키지로 이동 바람...
     * 2018-08-21 harry
     * </pre>
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateMbtlnum(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateMbtlnum", outbdCnsltVO);
    }


    /**
     * <pre>
     * 이동전화/일반전화 변경
     * 나중에 고객관리 패키지로 이동 바람...
     * 2018-08-21 harry
     * </pre>
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateTelnum(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateTelnum", outbdCnsltVO);
    }


    /**
     * 참고사항/비고 저장
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    public void updateRemark(OutbdCnsltVO outbdCnsltVO) throws Exception {

        update("outbdCnsltDAO.updateRemark", outbdCnsltVO);
    }

}
