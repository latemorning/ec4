package egovframework.ec4.call.outbd.service;

import java.util.List;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CnsltAppntBussPlcSetMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO
	 * @return List<cnsltAppntBussPlcSetMngVO>
	 * @exception Exception
	 */
	public List<CnsltAppntBussPlcSetMngVO> selectCnsltAppntBussPlcSetMng(CnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO) throws Exception;
	
}
