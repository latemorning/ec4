package egovframework.ec4.call.outbd.hpcl.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.hpcl.service.CnslrDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.EC4HpclService;
import egovframework.ec4.call.outbd.hpcl.service.HpclDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.HpclVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("hpclService")
public class EC4HpclServiceImpl extends EgovAbstractServiceImpl implements EC4HpclService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4HpclServiceImpl.class);

    @Resource(name = "hpclDAO")
    private HpclDAO hpclDAO;

    /** ID Generation */
    @Resource(name = "ec4HpclIdGnrService")
    private EgovIdGnrService hpclIdGnrService;


    /*
     * 해피콜 목록
     */
    @Override
    public ArrayList<EgovMap> selectHpclList(HpclDefaultVO searchVO) throws Exception {

        return hpclDAO.selectHpclList(searchVO);
    }


    /*
     * 해피콜 목록 카운트
     */
    @Override
    public int selectHpclListCnt(HpclDefaultVO searchVO) throws Exception {

        return hpclDAO.selectHpclListCnt(searchVO);
    }


    /*
     * 해피콜 - 캠페인 분배
     */
    @Override
    public void dstbHpcl(HpclVO hpclVO) throws Exception {

        for (HpclVO vo : hpclVO.getHpclList()) {

            hpclVO.setHpclId(vo.getHpclId());
            hpclVO.setOldCmpgnId(vo.getOldCmpgnId());

            hpclDAO.removeHpcl(hpclVO); // 기존 분배 제거
            hpclDAO.dstbHpcl(hpclVO);   // 분배 등록
        }
    }


    /*
     * 상담원 목록 임시메서드
     */
    @Override
    public ArrayList<EgovMap> selectCnslrList(CnslrDefaultVO searchVO) throws Exception {

        return hpclDAO.selectCnslrList(searchVO);
    }


    /*
     * 상담원 목록 카운트 임시메서드
     */
    @Override
    public int selectCnslrListCnt(CnslrDefaultVO searchVO) throws Exception {

        return hpclDAO.selectCnslrListCnt(searchVO);
    }


    /*
     * 해피콜 - 상담원 분배
     */
    @Override
    public void dstbCnslr(HpclVO hpclVO) throws Exception {

        int i = 0;
        int cnslrLen = hpclVO.getCnslrList().size();
        HpclVO[] cnslrArr = (HpclVO[])(hpclVO.getCnslrList()).toArray(new HpclVO[hpclVO.getCnslrList().size()]);

        for (HpclVO vo : hpclVO.getHpclList()) {

            hpclVO.setHpclId(vo.getHpclId());
            hpclVO.setSearchHpclId(vo.getHpclId());
            //            hpclVO.setCmpgnId(vo.getCmpgnId());

            hpclVO.setCnslrId(cnslrArr[i % cnslrLen].getCnslrId());

            if (hpclDAO.selectDstbCnt(hpclVO) > 0) {

                hpclDAO.dstbCnslrUpdate(hpclVO);   // 상담원 분배 업데이트
            } else {

                hpclDAO.dstbCnslrInsert(hpclVO);   // 상담원 분배 등록
            }

            i = i + 1;
        }

    }


    /*
     * 해피콜 - 상세
     */
    @Override
    public EgovMap selectHpcl(HpclVO hpclVO) throws Exception {

        LOGGER.debug("-- selectHpcl --");

        return hpclDAO.selectHpcl(hpclVO);
    }


    /*
     * 해피콜 필드 목록
     */
    @Override
    public ArrayList<EgovMap> selectHpclFieldList(HpclVO hpclVO) throws Exception {

        return hpclDAO.selectHpclFieldList(hpclVO);
    }


    /*
     * 콜상담 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCnsltList(HpclDefaultVO searchVO) throws Exception {

        return hpclDAO.selectCallCnsltList(searchVO);
    }


    /*
     * 콜상담 목록 카운트
     */
    @Override
    public int selectCallCnsltListCnt(HpclDefaultVO searchVO) throws Exception {

        return hpclDAO.selectCallCnsltListCnt(searchVO);
    }


    /*
     * 상담원에 분배된 해피콜 카운트 (분배됐으면 1, 아니면 0)
     */
    @Override
    public int selectDstbCnt(HpclDefaultVO searchVO) throws Exception {

        return hpclDAO.selectDstbCnt(searchVO);
    }


    /*
     * 해피콜 마감
     */
    @Override
    public void closHpcl(HpclVO hpclVO) throws Exception {

        for (HpclVO vo : hpclVO.getHpclList()) {

            hpclVO.setHpclId(vo.getHpclId());
            hpclVO.setHpclKey(vo.getHpclKey());

            hpclDAO.closHpcl(hpclVO);   // 마감처리
        }
    }

}
