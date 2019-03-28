package egovframework.ec4.call.cnslt.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4CnsltLicenseMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltLicenseMngVO cnsltLicenseMngVO
	 * @return List<cnsltLicenseMngVO>
	 * @exception Exception
	 */
	public List<CnsltLicenseMngVO> selectCnsltLicenseMng(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception;
	
	ArrayList<EgovMap> selectCnsltLicenseRegList(CnsltLicenseMngVO searchVO) throws Exception;
	
	int selectCnsltLicenseRegListCnt(CnsltLicenseMngVO searchVO) throws Exception;

    void insertCnsltLicense(CnsltLicenseMngVO searchVO) throws Exception;
    
    EgovMap selectCnsltLicenseMod(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception;

    void updateCnsltLicense(CnsltLicenseMngVO searchVO) throws Exception;

    void deleteCnsltLicense(CnsltLicenseMngVO searchVO) throws Exception;
	
}
