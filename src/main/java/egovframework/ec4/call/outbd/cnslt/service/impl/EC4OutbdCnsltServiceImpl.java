package egovframework.ec4.call.outbd.cnslt.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.cnslt.service.EC4OutbdCnsltService;
import egovframework.ec4.call.outbd.cnslt.service.OutbdCnsltVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("outbdCnsltService")
public class EC4OutbdCnsltServiceImpl extends EgovAbstractServiceImpl implements EC4OutbdCnsltService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4OutbdCnsltServiceImpl.class);

    @Resource(name = "outbdCnsltDAO")
    private OutbdCnsltDAO outbdCnsltDAO;


    /** ID Generation */
    //    @Resource(name = "ec4OutbdCnsltIdGnrService")
    //    private EgovIdGnrService outbdCnsltIdGnrService;

    /*
     * 해피콜 처리 이력 상담결과 등록
     */
    @Override
    public void insertCnsltResult(OutbdCnsltVO outbdCnsltVO) throws Exception {

        LOGGER.debug("EC4OutbdCnsltServiceImpl.insertCnsltResult");

        // 결과저장
        if (StringUtils.isNotBlank(outbdCnsltVO.getCallResultCode())) {

            // 해피콜 처리 이력 상담결과 등록
            outbdCnsltDAO.insertCnsltResult(outbdCnsltVO);

            // 해피콜 인터페이스 테이블의 진행상태 및 상담결과 업데이트
            outbdCnsltDAO.updateIntrfcResult(outbdCnsltVO);
        }

        // 수신동의
        if (StringUtils.isNotBlank(outbdCnsltVO.getRecptnAgreAt())) {

            // 나중에 고객관리 패키지로 이동 바람...
            // 2018-08-20 harry
            outbdCnsltDAO.updateRecptnAgre(outbdCnsltVO);
        }

        // 블랙리스트
        if (StringUtils.isNotBlank(outbdCnsltVO.getBlclstAt())) {

            // 나중에 고객관리 패키지로 이동 바람...
            // 2018-08-21 harry
            outbdCnsltDAO.updateBlclst(outbdCnsltVO);
        }

        // 전화번호 변경
        if (StringUtils.isNotBlank(outbdCnsltVO.getMbtlnumChange()) || StringUtils.isNotBlank(outbdCnsltVO.getTelnoChange())) {

            // 나중에 고객관리 패키지로 이동 바람...
            // 2018-08-21 harry
            outbdCnsltDAO.updateTelnum(outbdCnsltVO);
        }

        // 참고사항/비고 저장
        outbdCnsltDAO.updateRemark(outbdCnsltVO);

    }

}
