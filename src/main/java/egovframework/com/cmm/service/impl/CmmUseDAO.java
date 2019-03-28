package egovframework.com.cmm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.CmmnDetailCode;

import org.springframework.stereotype.Repository;

/**
 *
 * @Class Name : CmmUseDAO.java
 * @Description : 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 데이터 접근 클래스
 * @Modification Information
 *
 *               <pre>
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 3. 11.     이삼섭
 *               </pre>
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 11.
 * @version
 * @see
 *
 */
@Repository("cmmUseDAO")
public class CmmUseDAO extends EgovComAbstractDAO {

    /**
     * 주어진 조건에 따른 공통코드를 불러온다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectCmmCodeDetail", vo);
    }


    /**
     * 공통코드로 사용할 조직정보를 를 불러온다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectOgrnztIdDetail", vo);
    }


    /**
     * 공통코드로 사용할그룹정보를 를 불러온다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectGroupIdDetail", vo);
    }


    /**
     * 분류코드 테이블 내용을 코드 형식으로 반환
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectClCodeDetail(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectClCodeDetail", vo);
    }


    /**
     * 공통코드 테이블 내용을 코드 형식으로 반환
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectCodeDetail(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectCodeDetail", vo);
    }


    /**
     * 공통코드 테이블 내용을 코드 형식으로 반환
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectDetailCode(ComDefaultCodeVO vo) throws Exception {

        return (List<CmmnDetailCode>)list("CmmUseDAO.selectDetailCode", vo);
    }
}
